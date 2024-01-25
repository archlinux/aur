# Maintainer: Chenrry666 <chengruichen3@gmail.com>

pkgname=v2ray-rules-dat-git
_pkgname=v2ray-rules-dat
pkgdesc="Enhanced edition of V2Ray rules dat files, compatible with Trojan-Go. (without auto update)"
pkgver=r202401242209
pkgrel=1
arch=('any')
url="https://github.com/Loyalsoldier/v2ray-rules-dat"
license=('GPL3')

provides=('v2ray-domain-list-community' 'v2ray-geoip')
conflicts=('v2ray-domain-list-community' 'v2ray-geoip')

source=(
  "$pkgname::git+${url}.git#branch=release"
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s" "$(git log --pretty=\"format:%B\" HEAD | tr -dc '[:digit:]')"
}

package() {
  cd "${srcdir}/${pkgname}"
  sha256sum --check "./geoip.dat.sha256sum"
  sha256sum --check "./geosite.dat.sha256sum"

  install -Dm644 "./geoip.dat"   "${pkgdir}/usr/share/v2ray/geoip.dat"
  install -Dm644 "./geosite.dat" "${pkgdir}/usr/share/v2ray/geosite.dat"

  mkdir -p ${pkgdir}/usr/share/xray/
  ln -s "${pkgdir}/usr/share/v2ray/geoip.dat" "${pkgdir}/usr/share/xray/geoip.dat"
  ln -s "${pkgdir}/usr/share/v2ray/geosite.dat" "${pkgdir}/usr/share/xray/geosite.dat"
}
