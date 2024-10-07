# Contributor: Matthias Blaicher <matthias[at]blaicher[dot]com>
pkgname=gsvit
pkgver=1.9.4
pkgrel=1
pkgdesc="Open Source FDTD solver without graphics card computing support."
url="http://gsvit.net/"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('gwyddion' 'gtk2')
makedepends=('pangox-compat')

source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('5b4cc885f667eb4c894f9d1579fed8fa82e279def478b33def0482b9f84c943a')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export CFLAGS="${CFLAGS} -Wno-error=format-security -Wno-error=implicit-int"
  ./configure --without-cuda --prefix="${pkgdir}/usr"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et: 
