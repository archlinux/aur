# Maintainer: M0Rf30

_pkgname=composer-cli
pkgname=hyperledger-${_pkgname}
pkgver=0.11.3
pkgrel=1
pkgdesc="A framework for building Blockchain business networks: Contains the Hyperledger composer CLIs for administering business networks"
arch=(x86_64)
url="https://github.com/hyperledger/fabric"
license=('APACHE')
groups=('hyperledger-composer')
depends=('nodejs')
makedepends=('npm')
source=('hyperledger.sh')

package() {
  cd $srcdir

msg2 "Installing profile for global vars..."
  install -Dm755 hyperledger.sh $pkgdir/etc/profile.d/hyperledger.sh

  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" composer-cli@$pkgver

msg2 "Renaming composer to composer-cli (it's not php composer)"
  mv $pkgdir/usr/bin/composer $pkgdir/usr/bin/composer-cli
}
md5sums=('9f64f077d16502caf9dfcce138ffbb4e')
