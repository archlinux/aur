# Maintainer: justforlxz <justforlxz@gmail.com>

pkgname=ss-tproxy
pkgver=4.7.6
pkgrel=1
pkgdesc='搭建 SS/SSR/V2Ray/Socks5 透明代理环境的简易脚本'
arch=('x86_64' 'aarch64')
url="https://github.com/zfl9/ss-tproxy"
license=('GPL3')
depends=('ipset' 'dnsmasq' 'iptables' 'chinadns-ng-zfl9' 'dns2tcp-zfl9')
source=("$pkgname-v$pkgver::https://github.com/zfl9/ss-tproxy/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('SKIP')

prepare() {
  cd $pkgname-$pkgver
  sed -i 's/local\///g' ss-tproxy.service
}

package() {
  cd $pkgname-$pkgver
  install -d $pkgdir/usr/bin/
  install -d $pkgdir/etc/ss-tproxy
  install -d $pkgdir/usr/lib/systemd/system
  install -m 755 ss-tproxy $pkgdir/usr/bin
  install -m 644 ss-tproxy.conf gfwlist* chnroute* ignlist* $pkgdir/etc/ss-tproxy
  install -m 644 ss-tproxy.service $pkgdir/usr/lib/systemd/system
}
