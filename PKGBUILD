pkgname=wend-git
pkgver=r225.dc3867f
pkgrel=1
pkgdesc='Minimal presentation tool for Wayland'
url='https://sr.ht/~tardypad/wend/'
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
  'git+https://git.sr.ht/~tardypad/wend'
)

sha512sums=(
  'SKIP'
)

pkgver() {
  cd wend
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd wend
  arch-meson -Dzsh-completions=true build
  meson compile -C build
}

check() {
  cd wend
  meson test -C build --print-errorlogs
}

package() {
  cd wend
  meson install -C build --destdir "${pkgdir}"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
