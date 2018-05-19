# Maintainer: https://aur.archlinux.org/account/JunioCalu
# Contributor: https://aur.archlinux.org/account/devopsdeluxe

pkgname='gnome-shell-communitheme'
pkgver=r242.fe8cb17
pkgrel=1
pkgdesc='GNOME Shell Ubuntu community theme "communitheme"'
arch=('any')
url='https://community.ubuntu.com/c/desktop/theme-refresh'
license=('GPL3')
makedepends=('git' 'meson' 'ninja' 'sassc')
source=(
  "${pkgname}::git+https://github.com/Ubuntu/gnome-shell-communitheme.git"
  'fix-install-dirs.patch'
)
sha256sums=(
  'SKIP'
  'd499d124a0c1836ee32e645600817f17b5946ecdaaf2c9e95a185a4aaec6e1de'
)

pkgver() {
  cd "${pkgname}"

  printf "r%s.%s"                    \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname}"

  git apply ../fix-install-dirs.patch
  meson build           \
    --buildtype=release \
    --prefix=/usr

  ninja -C build
}

package() {
  cd "${pkgname}"

  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
