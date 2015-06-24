# Maintainer: Saber

pkgname="shadowsocks-go"
pkgver=1.1.4
pkgrel=1
pkgdesc="go port of shadowsocks. USAGE located at https://github.com/SaberSalv/aur/tree/master/shadowsocks-go"
arch=("x86_64")
url="https://github.com/shadowsocks/shadowsocks-go"
license=("Unkown")
conflicts=("shadowsocks")
provides=("shadowsocks")
_CARCH=$([[ $CARCH == "x86_64" ]] && echo "64" || echo "32")
source=(
  "http://dl.chenyufei.info/shadowsocks/${pkgver}/shadowsocks-local-linux${_CARCH}-${pkgver}.gz"
  "http://dl.chenyufei.info/shadowsocks/${pkgver}/shadowsocks-server-linux${_CARCH}-${pkgver}.gz"
  "shadowsocks@.service"
  "shadowsocks-server@.service")
md5sums=('ea399d49b433e8cae687215a468b17d3'
         '6986def625555ed7fe62b40a85396e4e'
         'd26ab75cfad5f9cabfccbcbb9801950a'
         'b69a7bc69bd9138e3d092ced44a102a3')

package() {
  install -D -m755 "shadowsocks-local-linux${_CARCH}-${pkgver}" "$pkgdir/usr/bin/sslocal"
  install -D -m755 "shadowsocks-server-linux${_CARCH}-${pkgver}" "$pkgdir/usr/bin/ssserver"

  install -d "$pkgdir/etc/shadowsocks"
  install -D -m644 shadowsocks@.service "$pkgdir/usr/lib/systemd/system/shadowsocks@.service"
  install -D -m644 shadowsocks-server@.service "$pkgdir/usr/lib/systemd/system/shadowsocks-server@.service"
}

# vim:set ts=2 sw=2 et:
