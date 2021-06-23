# Maintainer  : Matthias Fulz < mfulz [at] olznet [dot] de >

pkgname=ospd-openvas
pkgver=21.4.0
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
sha512sums=('b9a25f61599a191124d65279b96e25b1b30d0c4bf3f101611ca55c0b9e1306b0d4f259278f5705255cbc70dbabf88d7b9ee5f571fa8af73edc9704a37c054070'
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
