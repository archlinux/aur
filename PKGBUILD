# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname=adsbexchange-stats-git
_gitname=adsbexchange-stats
pkgver=r121.47473bd
pkgrel=1
pkgdesc="ADSBexchange.com Statistics."
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/adsbxchange/adsbexchange-stats"
license=('GPL3')
depends=('readsb' 'curl' 'jq' 'inotify-tools' 'gzip')
makedepends=('git')

source=('adsbexchange-stats::git+git://github.com/adsbxchange/adsbexchange-stats'
	'adsbexchange-stats.service')

sha256sums=('SKIP'
            '622b2c0c9e6a822b76ad5a77bbb23b320ee113d9e6ee71db08eb3cdb8e72dde6')

pkgver() {
  cd "${srcdir}/${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -D -m 755 "${srcdir}/${_gitname}/json-status" "${pkgdir}/usr/bin/adsbexchange-stats"
  install -D -m 755 "${srcdir}/${_gitname}/adsbexchange-showurl" "${pkgdir}/usr/bin/adsbexchange-showurl"
  install -D -m 644 adsbexchange-stats.service "${pkgdir}/usr/lib/systemd/system/adsbexchange-stats.service"
}
