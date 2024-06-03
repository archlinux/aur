# Maintainer: Scott Alfter <scott@alfter.us>

pkgname=nulib2
pkgver=3.1.0
pkgrel=1
provides=("nulib2")
pkgdesc="utility for manipulating NuFX archives"
arch=("x86_64")
url="http://www.nulib.com/"
license=("BSD")
depends=("nufxlib")
source=(
	${pkgname}-${pkgver}.tar.gz::https://github.com/fadden/nulib2/archive/v${pkgver}.tar.gz
	${pkgname}-${pkgver}-make.patch
	)
sha256sums=(
	"383127d6966edae09da550f4d7197e68eed101d239f2a23cee42dc086506af12"
	"273e337c0f5c7f31e153f2d6c2e8280a78f11790de216fc7388756f8d41d1ded"
	)

prepare()
{
  cd ${pkgname}-${pkgver}/nulib2
  patch -p1 -i ${srcdir}/${pkgname}-${pkgver}-make.patch
  ./configure --prefix=/usr
}

build()
{
  cd ${pkgname}-${pkgver}/nulib2
  make 
}

package()
{
  cd ${pkgname}-${pkgver}/nulib2
  mkdir -p ${pkgdir}/usr/bin
  cp nulib2 ${pkgdir}/usr/bin/
}
