# Maintainer: Zenvie <134689569+Zenvie@users.noreply.github.com>
# Contributor: Chenrry666 <chengruichen3@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=v2ray-rules-dat
pkgver=202403242210
pkgrel=2
pkgdesc="Enhanced edition of V2Ray rules dat files, compatible with Xray and Hysteria."
arch=(any)
url="https://github.com/Loyalsoldier/$pkgname"
license=('GPL-3.0-or-later')

provides=(v2ray-domain-list-community v2ray-geoip)
conflicts=(v2ray-domain-list-community v2ray-geoip)

source=("geoip.dat::$url/releases/download/$pkgver/geoip.dat"
        "geosite.dat::$url/releases/download/$pkgver/geosite.dat")
sha256sums=('6e0e73e3656b83f0fad9cb61a8f33b6c896e8cb1cb2db1502f0691640680fe88'
            '5bbd5ce20006a41f719f410d898f0a838d5bfe643fac37b6e32729e16aae9539')

package() {  
  install -dm755 "$pkgdir/usr/share/v2ray"
  install -Dm644 "geoip.dat"   "$pkgdir/usr/share/v2ray/geoip.dat"
  install -Dm644 "geosite.dat" "$pkgdir/usr/share/v2ray/geosite.dat"

  install -dm755 "$pkgdir/usr/share/xray"
  ln -s "/usr/share/v2ray/geoip.dat" "$pkgdir/usr/share/xray/geoip.dat"
  ln -s "/usr/share/v2ray/geosite.dat" "$pkgdir/usr/share/xray/geosite.dat"

  install -dm755 "$pkgdir/usr/share/hysteria"
  ln -s "/usr/share/v2ray/geoip.dat" "$pkgdir/usr/share/hysteria/geoip.dat"
  ln -s "/usr/share/v2ray/geosite.dat" "$pkgdir/usr/share/hysteria/geosite.dat"
}
