# Maintainer: LightDot <lightdot -a-t- g m a i l>

_pkgname=eflete
pkgname=$_pkgname-git
pkgver=1.19.1.r15.g9779b5a17
pkgrel=1
pkgdesc="EFL Edje graphical UI and theme editor - development version"
arch=('x86_64')
url="https://www.enlightenment.org/about-eflete"
license=('GPL2')
makedepends=('efl' 'git')
depends=('efl')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git+https://git.enlightenment.org/tools/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --tags --long | sed 's/^v//;s/-/.r/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}"
  sed -i "s|1.20.9999|1.21.9999|g" "./configure.ac"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}" install
}
