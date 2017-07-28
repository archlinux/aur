# Maintainer: lilydjwg <lilydjwg@gmail.com>
pkgname=archsocks
pkgdesc="archsocks 网络加速代理"
pkgver=0.6
pkgrel=1
arch=('any')
url="https://github.com/archsocks/archsocks"
license=()
depends=('python-aiohttp' 'python-chardet' 'iptables')
install=${pkgname}.install
source=("archsocks-${pkgver}.tar.gz::http://205.185.127.123/files/archsocks.tar.gz"
        archsocks
        archsocks.service
)

build() {
  true
}

package() {
  _pyver=$(python -c 'import sys; print("%d.%d" % sys.version_info[:2])')
  cd "$srcdir/archsocks-files/lib"

  mkdir -p "$pkgdir/usr/lib/python$_pyver/site-packages"
  cp -r archsocks_client_updater "$pkgdir/usr/lib/python$_pyver/site-packages"
  cp -r archsocks_common "$pkgdir/usr/lib/python$_pyver/site-packages"
  python3 -m compileall "$pkgdir/usr/lib/python$_pyver/site-packages"

  cd "$srcdir"
  install -Dm755 archsocks "$pkgdir/usr/bin/archsocks"
  install -Dm644 archsocks.service "$pkgdir/usr/lib/systemd/system/archsocks.service"
  install -dm750 "$pkgdir/var/lib/archsocks"
}

sha256sums=('7bd6a7d9fc5c712a271e40f1874a7d2d272f469dae96984aeb223555fa13a382'
            'dac4cba524d950d068ea13ea467f5d42da308106e15bb45293fa28f225692c53'
            'c21c0fe29393e6ef45d018b6402f6c493888e93dfde26852f1a6638632061c4b')
