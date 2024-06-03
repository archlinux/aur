# Maintainer: Scott Alfter <scott@alfter.us>

pkgname=nufxlib
pkgver=3.1.0
pkgrel=1
provides=("nufxlib")
pkgdesc="library for manipulating NuFX archives"
arch=("x86_64")
url="http://www.nulib.com/"
license=("BSD")
depends=()
source=(
	${pkgname}-${pkgver}.tar.gz::https://github.com/fadden/nulib2/archive/v${pkgver}.tar.gz
	${pkgname}-${pkgver}-make.patch
	)
sha256sums=(
	"383127d6966edae09da550f4d7197e68eed101d239f2a23cee42dc086506af12"
	"dbca0b1ad83f3c3eff0dd05ea5886b5b82516c02f46d038469cc8c4d70886f7c"
	)

prepare()
{
  cd nulib2-${pkgver}/nufxlib
  patch -p1 -i ${srcdir}/${pkgname}-${pkgver}-make.patch
  ./configure --prefix=/usr
}

build()
{
  cd nulib2-${pkgver}/nufxlib
  make 
}

package()
{
  cd nulib2-${pkgver}/nufxlib
  make libdir=${pkgdir}/usr/lib includedir=${pkgdir}/usr/include install
}
