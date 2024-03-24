pkgname=takang-git
pkgver=r209.646371f
pkgrel=1
pkgdesc='Minimal presentation tool for Wayland'
url='https://sr.ht/~tardypad/takang/'
arch=('any')
license=('GPL3')

makedepends=(
  'git'
  'meson'
  'scdoc'
  'wayland-protocols'
)

depends=(
  'libxkbcommon'
  'pango'
  'wayland'
)

source=(
  'git+https://git.sr.ht/~tardypad/takang'
)

sha512sums=(
  'SKIP'
)

pkgver() {
  cd takang
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd takang
  arch-meson build
  meson compile -C build
}

check() {
  cd takang
  meson test -C build --print-errorlogs
}

package() {
  cd takang
  meson install -C build --destdir "${pkgdir}"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
