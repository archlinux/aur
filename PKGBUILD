# Maintainer: lilydjwg <lilydjwg@gmail.com>
pkgname=archsocks
pkgdesc="archsocks 网络加速代理"
pkgver=0.3
pkgrel=1
arch=('any')
url="http://www.archsocks.com/"
license=()
depends=('python-aiohttp' 'python-chardet' 'iptables')
install=${pkgname}.install
source=("archsocks-${pkgver}.tar.gz::http://104.245.8.176/files/archsocks.tar.gz"
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

sha256sums=('e50965ad072364525036d2a64d87e8d48c1560ceda47dd1e208cd3c431faf912'
            'dac4cba524d950d068ea13ea467f5d42da308106e15bb45293fa28f225692c53'
            '27a170b2541b138d5b11a7e3bbbb27b13dd4474da929ac91659a4d06fab84b9a')
