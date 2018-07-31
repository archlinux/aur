# Maintainer: Haruue Icymoon <haruue@caoyue.com.cn>, PinkD <443657547@qq.com>
# Co-Maintainer: PinkD

pkgname=port-protection
_pkgbase=PortProtection
pkgver=1.1
pkgrel=1
pkgdesc='A program to protect port with iptables by authorizing client on another port'
arch=('i686' 'x86_64')
url='https://github.com/PinkD/PortProtection'
license=('GPL2')
depends=('openssl')
makedepends=('cmake')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/PinkD/PortProtection/archive/$pkgver.tar.gz")
md5sums=('e4094aadc55719b4e6c6ef8d30b539a9')

build() {
  cd "$srcdir/$_pkgbase-$pkgver"
  mkdir -p build
  cd build
  cmake ..
  make
}

package() {
  cd "$srcdir/$_pkgbase-$pkgver"
  install -Dm 755 "build/port-protection" "$pkgdir/usr/bin/port-protection"
  install -Dm 644 "config/sample.conf" "$pkgdir/etc/portpro/sample.conf"
  install -Dm 644 "tools/systemd/port-protection@.service" "$pkgdir/usr/lib/systemd/system/port-protection@.service"
}
