# Maintainer: fryfrog@gmail.com

pkgname=adsbexchange-stats-git
_gitname=adsbexchange-stats
pkgver=r80.0e2b267
pkgrel=1
pkgdesc="ADSBexchange.com Statistics."
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/adsbxchange/adsbexchange-stats"
license=('BSD')
depends=('readsb' 'curl' 'jq' 'inotify-tools' 'gzip')
makedepends=('git')

source=('adsbexchange-stats::git+git://github.com/adsbxchange/adsbexchange-stats'
	'adsbexchange-stats.service')

sha256sums=('SKIP'
            'e6ef0503ebf8022ad5c0a320dde1bd94a5e69c7649a697069c2b8184d02ea0fd')

pkgver() {
  cd "${srcdir}/${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -D -m 755 "${srcdir}/${_gitname}/json-status" "${pkgdir}/usr/bin/adsbexchange-stats"
  install -D -m 644 adsbexchange-stats.service "${pkgdir}/usr/lib/systemd/system/adsbexchange-stats.service"
}
