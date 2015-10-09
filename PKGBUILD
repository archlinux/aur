# Maintainer: David Parrish <daveparrish@gmail.com>

pkgname=metamarket-git
pkgver=r56.35ca76a
pkgrel=1
pkgdesc="METAmarket"
arch=('i686' 'x86_64')
url="https://github.com/metamarcdw/metamarket.git"
license=('MIT')
conflicts=('modemmanager')
#makedepends=('go' 'gmp')
depends=('python2-simplejson' 'python2-scrypt' 'python2-crypto' 'python2-simple-crypt'
        'python2-pycoin' 'python2-python-bitcoinlib' 'python2')
provides=("mmcli")
source=("${pkgname}::git+https://github.com/metamarcdw/metamarket.git"
  "mmcli.sh")
sha256sums=('SKIP'
            'a7f6b5448d73e789808c40a8e03f48da1b37b5fcf77b7cbbb1cba05089781790')

pkgver() {
  cd "$pkgbase"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  # Copy everything to /opt/metamarket
  install -dm755 "$pkgdir/opt/metamarket"
  cp -r "${pkgname}"/* "$pkgdir"/opt/metamarket/

  # Create binary script
  install -Dm755 mmcli.sh "$pkgdir"/usr/bin/mmcli
  install -Dm644 "${pkgname}"/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
