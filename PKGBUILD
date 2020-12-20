# Maintainer: MidAutumnMoon <mid.autumn0moon@gmail.com>
pkgname=v2ray-rules-dat-git
pkgdesc="Enhanced edition of V2Ray rules dat files, compatible with Trojan-Go."
pkgver=r253.0fae67f
pkgrel=1
arch=('any')
url="https://github.com/Loyalsoldier/v2ray-rules-dat"
license=('GPL3')

provides=('v2ray-domain-list-community' 'v2ray-geoip')
conflicts=('v2ray-domain-list-community' 'v2ray-geoip')

makedepends=('git')

source=(
  "$pkgname::git+$url.git"
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "$srcdir/$pkgname"
  git checkout master > /dev/null 2> /dev/null
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"
  git checkout release
  install -D -m644 "$srcdir/$pkgname/geoip.dat" "$pkgdir/usr/share/v2ray/geoip.dat"
  install -D -m644 "$srcdir/$pkgname/geosite.dat" "$pkgdir/usr/share/v2ray/geosite.dat"
}
