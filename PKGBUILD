# Maintainer: LinArcx <linarcx@gmail.com>

pkgname='giti-git'
pkgver=1.0.0.r2.g67944fc
pkgrel=1
pkgdesc='Permanent observer of your git directories'
arch=('any')
url='https://github.com/LinArcX/giti'
license=('GPL-3.0')
makedepends=('git' 'meson' 'pkgconf' 'vala' 'ninja')
depends=('gtk3' 'libgit2' 'libgee' 'granite')
source=("${pkgname}::git+https://github.com/LinArcX/giti.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
	arch-meson giti-git build
	ninja -C build
}

package() {
	DESTDIR="${pkgdir}" ninja -C build install
}
