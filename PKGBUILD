# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Matheus <matheusgwdl@protonmail.com>
pkgname=usearch
_pkgname=usearch12
pkgver=12.0_beta1
_pkgver=${pkgver//_/-}
pkgrel=1
pkgdesc="Open-source usearch"
arch=('x86_64')
url="https://github.com/rcedgar/usearch12"
license=('GPL-3.0-or-later')
depends=('gcc-libs')
makedepends=('gcc' 'make' 'ccache')
source=(${url}/archive/refs/tags/v${_pkgver}.tar.gz
	"gcc15.patch::https://github.com/rcedgar/usearch12/compare/master...starsareintherose:usearch12:master.patch")
sha256sums=('dbb06e4733801dab1c405616880261bd885ab171dfdb1d44e8ede48d739cdc43'
            '3a1b57feb3c647133e3473fc55f02410cd5004b622fe9dd55e4ad223e21a8430')

prepare() {
  cd "$_pkgname-$_pkgver"
  patch -p1 -i ../gcc15.patch
}

build() {
  cd "$_pkgname-$_pkgver"
  cd src
  make
}


package(){
  cd "$_pkgname-$_pkgver"
  install -Dm755 bin/$_pkgname $pkgdir/usr/bin/$pkgname
}
