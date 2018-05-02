# Contributor: Pierre-Paul Paquin <pierrepaulpaquin@gmail.com>
# Maintainer: David Phillips <google mail, and my username dbphillipsnz>

_qt=qt4
pkgname=qbrew
pkgver=0.4.1
pkgrel=6
pkgdesc="Homebrewer's beer recipe calculator"
arch=('i686' 'x86_64')
url="http://www.usermode.org/code.html"
license=('BSD')
depends=(${_qt})
source=("http://www.usermode.org/code/${pkgname}-${pkgver}.tar.gz"
        'return-false.diff')
sha512sums=('9910c9070129b14bb4bd0f2d0356e07f53bbc2d1750e9eece8cbb668ee9eb8bd534fd0641f0cf8be4194f5f470b8b7d193d413c59aa0b69cc6d87d6453f247a4'
            'f062ea0d3ab7fd01617549a8d4121d95e3689190aaf50cf74a664f7b87d09106704f8167ca6faad6cae501f5470746549ef1317ee86eb4c33c2faf09c4159cdb')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	patch -Np1 -i "${srcdir}/return-false.diff"
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	export QMAKE=qmake-qt4
	./configure --prefix="${pkgdir}/usr" --qtdir="/usr/lib/${qt}"
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make install
	install -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
