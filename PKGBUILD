# Maintainer: Kainoa Kanter <kainoa@t1c.dev>

_pkgname=bookup
pkgname="$_pkgname-git"
pkgver=r280.g7ec8a1d
pkgrel=1
pkgdesc='A markdown note-taking application for Gnome'
url='https://gitlab.gnome.org/ilhooq/bookup'
arch=('aarch64' 'x86_64')
license=('GPL-3.0-only')
depends=('glibc' 'gtk4' 'discount' 'webkit2gtk') # discount provides libmarkdown. the more you know!
makedepends=('ninja' 'meson' 'clang')
provides=("$_pkgname")
source=("git+https://gitlab.gnome.org/ilhooq/bookup.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}" || exit
    printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  arch-meson build
  ninja -C build
}

package() {
  cd "${srcdir}/${_pkgname}"
  DESTDIR="${pkgdir}" ninja -C build install
}
