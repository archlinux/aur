# Maintainer: https://aur.archlinux.org/account/JunioCalu
# Contributor: https://aur.archlinux.org/account/devopsdeluxe

pkgname='gtk-communitheme-git'
pkgver=r556.22ed5e7
pkgrel=1
pkgdesc='The GTK+ 2 and 3 parts of the Ubuntu community theme "Communitheme"'
arch=('any')
url='https://community.ubuntu.com/c/desktop/theme-refresh'
license=('GPL3')
makedepends=('git' 'meson' 'ninja' 'sassc')
source=("${pkgname}::git+https://github.com/Ubuntu/gtk-communitheme.git")
sha256sums=('SKIP')

pkgver() {
 cd "${pkgname}"

  printf "r%s.%s"                  \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname}"

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
