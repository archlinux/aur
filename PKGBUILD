# Maintainer: banana-bred <j.forer@posteo.net>

pkgname='tptable-git'
pkgver=r41.ab1ecc1
pkgrel=1
pkgdesc="A TUI periodic table for GNU/Linux terminals coded in C"
arch=('any')
url='https://github.com/velorek1/terminalperiodictable'
license=('MIT')
groups=()
depends=()
makedepends=('git' 'make')
checkdepends=()
optdepends=()
provides=('tptable')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
noextract=()
source=("${pkgname%-*}::git+${url}.git")
sha256sums=('SKIP')

prepare() {

  # -- replace hard-coded "/usr/share/ptable" directroy with "/usr/share/${pkgname%-*}" in main.c so that the element info
  #    can actually be read
  sed -i "s/\/usr\/share\/ptable\/elements.dat/\/usr\/share\/${pkgname%-*}\/elements.dat/" "${srcdir}/${pkgname%-*}"/main.c

}

pkgver() {

  cd "${srcdir}/${pkgname%-*}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

build() {

  cd "${srcdir}/${pkgname%-*}"

  make all

}

package() {

	install -Dm 755 "${srcdir}/${pkgname%-*}/${pkgname%-*}" "${pkgdir}"/usr/bin/${pkgname%-*}

	install -Dm 644 ${srcdir}/${pkgname%-*}/elements.dat "${pkgdir}/usr/share/${pkgname%-*}"/elements.dat

}

# vim: ts=2 sw=2 et :
