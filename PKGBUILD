# Contributor: éclairevoyant
# Contributor: Mikael Blomstrand <gmail.com: kmbloms>
# Contributor: Árni Dagur <arnidg@protonmail.ch>

pkgname=futhark
pkgver=0.22.4
pkgrel=1
pkgdesc="A data-parallel functional programming language."
arch=('x86_64')
url='https://futhark-lang.org/'
license=('ISC')
depends=('ncurses5-compat-libs' 'zlib')
makedepends=('cabal-static' 'ghc>=7.0.1' 'ghc-libs' 'ghc-static')
optdepends=('opencl-headers: OpenCL backend'
            'cuda: CUDA backend'
            'python-pyopencl: PyOpenCL backend')
source=("$pkgname-$pkgver.tar.gz::https://github.com/diku-dk/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5edf79ed2076192ead64efb8a4d30d05b56b2c1ec5bdd0905c33d6099d312850')

prepare() {
	cd $pkgname-$pkgver
	make configure
}

build() {
	cd $pkgname-$pkgver
	make build
}

package() {
	cd $pkgname-$pkgver
	make PREFIX="$pkgdir/usr" install
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
