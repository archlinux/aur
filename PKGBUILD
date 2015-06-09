# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=nodejs-async
_npmname=async
pkgver=0.9.2
pkgrel=1
pkgdesc="Higher-order functions and common patterns for asynchronous code"
arch=('any')
makedepends=('nodejs' 'nodejs-uglify-js')
checkdepends=('nodejs-nodeunit')
url="https://github.com/caolan/async"
license=('MIT')
provides=('nodejs-async')
source=("https://github.com/caolan/$_npmname/archive/$pkgver.tar.gz"
        'Makefile.patch')
md5sums=('13c1cfbc4fc6b99b0d4e94cd1d453e16'
         'd514b5c61b237cbe1b225d15389eb110')

prepare() {
  cd $srcdir/${pkgname#nodejs-}-$pkgver
  patch -p0 -i $srcdir/Makefile.patch
}

build() {
  cd $srcdir/${pkgname#nodejs-}-$pkgver
  make build
}

check() {
  cd $srcdir/${pkgname#nodejs-}-$pkgver
  make test
}

package() {
  mkdir -m755 -p $pkgdir/usr/lib/node_modules/async/lib
  cd $srcdir/${pkgname#nodejs-}-$pkgver
  install -m644 -t $pkgdir/usr/lib/node_modules/async README.md {bower,component,package}.json
  install -m644 -t $pkgdir/usr/lib/node_modules/async/lib lib/async.js dist/async.min.js
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}


