# Maintainer: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>

pkgname=redex
pkgver=1.1.0
pkgrel=1
pkgdesc="A bytecode optimizer for Android apps"
arch=('i686' 'x86_64')
url="http://fbredex.com/"
license=('BSD')
depends=('python' 'boost-libs' 'jsoncpp')
makedepends=('boost')
source=("https://github.com/facebook/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('af2c81db4e0346e1aeef570e105c60ebfea730d62fd928d996f884abda955990')

prepare() {
  cd "$pkgname-$pkgver"

  sed -i 's/ANDROID_SDK/ANDROID_HOME/g' redex.py
}

build() {
  cd "$pkgname-$pkgver"

  autoreconf -ivf
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
