# Maintainer: Erim <Erim4@yahoo.com>
# Contributor:  Anton Kudelin <kudelin at protonmail dot com>
# Contributor: Hector <hsearaDOTatDOTgmailDOTcom>

pkgname=xdrawchem
pkgver=2.0.1
pkgrel=1
pkgdesc='A two-dimensional molecule drawing program'
url='https://github.com/bryanherger/xdrawchem'
license=("GPL")
arch=('x86_64')
depends=('openbabel>=3' 'qt6-base>=6.4')
makedepends=('cmake')
source=($pkgname-$pkgver.tar.gz::"https://github.com/bryanherger/$pkgname/archive/$pkgver-1.tar.gz")
sha256sums=('cd85efc30e266da0283bd25535387e62a6526038a7974dca14d67409735362fa')

prepare() {
  cd "$srcdir/$pkgname-$pkgver/xdrawchem-qt5"
  mkdir "build"
  cd "build"
}

build() {
  cd "$srcdir/$pkgname-$pkgver/xdrawchem-qt5/build"
  cmake .. -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  ninja  
}

package() {
  cd "$srcdir/$pkgname-$pkgver/xdrawchem-qt5"
  install -Dm755 build/xdrawchem "$pkgdir/usr/bin/xdrawchem"
  install -Dm755 ring/* -t "$pkgdir/usr/share/xdrawchem"
  install -Dm755 doc/* -t "$pkgdir/usr/share/xdrawchem/doc"
  install -Dm644 xdrawchem.desktop "$pkgdir/usr/share/applications/xdrawchem.desktop"
}
