# Maintainer: robertfoster

_pkgname=indy-node
pkgname=hyperledger-${_pkgname}
pkgver=1.2.284
pkgrel=1
pkgdesc="A self-sovereign identity ecosystem on top of a distributed ledger. It is the core project for Indy"
arch=(i686 x86_64)
url="https://github.com/hyperledger/${_pkgname}"
license=('APACHE')
groups=('hyperledger')
depends=('python-dateutil' 'hyperledger-indy-plenum' 'python-timeout-decorator')
makedepends=('python')
source=("https://github.com/hyperledger/${_pkgname}/archive/$pkgver-master.tar.gz")

package() {
  cd $srcdir/${_pkgname}-$pkgver-master
  python setup.py install -O1 --root="$pkgdir"
  install -Dm644 indy_node/general_config/general_config.py $pkgdir/etc/indy/indy_config.py
  rm -rf $pkgdir/home
  rm -rf $pkgdir/usr/bin/{get_keys,init_bls_keys}
  rm -rf $pkgdir/usr/lib/python3.6/site-packages/data/{__init__.py,__pycache__}
}

md5sums=('dc98170bbb10ea1504084b44576a708f')
