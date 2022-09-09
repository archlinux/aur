#Maintainer: Dylan Delgado <dylan1496 at live dot com>

pkgname=gpuowl
pkgver=7.2
pkgrel=2
pkgdesc="GPU Mersenne primality test"
arch=('x86_64')
url="https://github.com/preda/gpuowl"
license=('GPL3')
depends=('ocl-icd' 'gmp')
makedepends=('gcc11')
source=("https://github.com/preda/gpuowl/archive/v${pkgver}.tar.gz"
       'comp.patch')
sha256sums=('de773b893feb0dd1fd08331a38576d6e885871db9638c9cbf644da47c39c1006'
	   'e21d857ecd8536f6a90731bf2783a0d683735f815b62137fa83e9abc830a6654')

prepare() {
cd ${srcdir}/${pkgname}-${pkgver}/
patch --strip=1 < ../comp.patch
}

build() {
cd ${srcdir}/${pkgname}-${pkgver}/
make gpuowl
}

package () {
cd ${srcdir}/${pkgname}-${pkgver}/
install -Dm755 gpuowl ${pkgdir}/usr/bin/gpuowl
}
