# Maintainer: Rafal Malachowicz <k5hv@linux.pl>
# Contributor: Nick Burrett <nick@sqrt.co.uk>
pkgname=comskip-git
_pkgname=comskip
__pkgname=Comskip
pkgver=0.82.009.r27.g9c89619
pkgrel=1
pkgdesc='Comskip is a free MPEG commercial break detector'.
url='http://github.com/erikkaashoek/Comskip/'
arch=('x86_64' 'i686')
license=('GPL2')
makedepends=('git')
depends=('ffmpeg' 'argtable')
optdepends=('sdl: comskip-gui')
provides=($_pkgname)
conflicts=($_pkgname)
source=("git+${url}")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${__pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//'
}

build() {
  cd "${srcdir}/${__pkgname}"
  ./autogen.sh
  ./configure --prefix=/usr
  make clean
  make
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  install -m755 "${srcdir}/${__pkgname}/comskip" "$pkgdir/usr/bin/comskip"
  if [ -e "${srcdir}/${__pkgname}/comskip-gui" ]; then
    install -m755 "${srcdir}/${__pkgname}/comskip-gui" "$pkgdir/usr/bin/comskip-gui"
  fi
}
