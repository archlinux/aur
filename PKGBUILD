# Maintainer  : Matthias Fulz < mfulz [at] olznet [dot] de >

pkgname=ospd-openvas
pkgver=20.8.1
pkgrel=1
pkgdesc='OSP Server for openvas'
arch=('x86_64')
url="https://github.com/greenbone/ospd-openvas"
license=('GPL')
depends=('python-ospd' 'python-redis' 'python-psutil' 'python-packaging' 'openvas-scanner')
provides=('python-ospd-openvas')
conflicts=('python-ospd-openvas')
makedepends=('python-setuptools')
groups=('greenbone-vulnerability-manager')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/greenbone/ospd-openvas/archive/v${pkgver}.tar.gz"
        "ospd-openvas"
        "ospd-openvas.service")
sha512sums=('fb4ceb0a2306255e59948fe2246f9c66adefb4e68e26d3a8f95366a9ef1cb5581a3b036f6982cdd4c8499a9fb1e6acbe72041144e9ff3a057fc253e0684c0c0f'
            '3461820543ac6bc0cd50026023a6271e015123366fc44ce66ead1221d52c9e534063881f3b46a50a6e43ec9caff697376c35f1ce2cd22944e7b58f02070a78a8'
            'ddaa5ad183265df4a89661acde7f0c8a5d1fd4c0748e3ca2dd267d3e7e05e6975a62023833bdd048ab97076c9ec839e7ad2fd463ef16b246e5813e328956b50e')

check() {
  cd "$srcdir/$pkgname-$pkgver"
    LANG=en_US.UTF-8 pytest
}

package() {
  cd "$pkgname-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1

  install -d $pkgdir/etc/default
  install -m 644 $srcdir/ospd-openvas $pkgdir/etc/default
  install -d $pkgdir/usr/lib/systemd/system
  install -m 644 $srcdir/ospd-openvas.service $pkgdir/usr/lib/systemd/system
}
