# Maintainer: Assaf Sapir <meijin007 at gmail dot com>
# Contributor: Ranieri Althoff <ranisalt+aur at gmail dot com>
# Contributor: Jimmy Xu <me at jimmyxu dot org>
# Contributor: Yuval Adam <yuval at y3xz dot com>

pkgname=flightradar24
_pkgname=fr24feed
pkgver=1.0.57
pkgrel=1
_pkgver=1.0.57-1
pkgdesc='Feeder software for Flightradar24.com (fr24feed)'
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'aarch64')
url='https://www.flightradar24.com/share-your-data'
license=('custom')
depends=('bash' 'dump1090')
optdepends=('dump978: for 978MHz UAT support')
backup=(etc/fr24feed.ini)
install=flightradar24.install
source=('fr24feed.service'
        'fr24uat-feed.service'
        'flightradar24.sysusers'
        'fr24feed-status.patch'
        'hostname')
_url="https://repo-feed.flightradar24.com/pool/raspberrypi-stable/f/${_pkgname}"
source_x86_64=("$_url/${_pkgname}_${_pkgver}_amd64.deb")
source_i686=("$_url/${_pkgname}_${_pkgver}_i386.deb")
source_armv6h=("$_url/${_pkgname}_${_pkgver}_armhf.deb")
source_armv7h=("$_url/${_pkgname}_${_pkgver}_armhf.deb")
source_aarch64=("$_url/${_pkgname}_${_pkgver}_arm64.deb")

sha256sums=('1a4e30ae787dc2b7145723f703d09d2a43071a6ebb788130d362458037306743'
            'f8a45a74fb6129f0533fbe9213df3cdfdbb10383fcad45b9ff67be0b7c430e0b'
            'a018c751e431fcde72e709917fdfe663a5c74040af80b56d1a4658ba962c95e5'
            'ebcf31ecb62aef650b0984f978318f7e716078f520efb165306dca592c0821bb'
            '32ae61984ae0123690fea0bf67f2b5f1ee1155f6a2b3a9d0ff7c5431d902ddee')
sha256sums_x86_64=('2db8d2cbe1143060aab24a42a8d42c089d7c2721b47f8ef44e588a5ba9bc2435')
sha256sums_i686=('a45ec62aa451100c4af29d0a693517cd9dc2898cb9c9a4afa774cc7a98ba35d1')
sha256sums_armv6h=('13142851a73d1a503d3963dfe9df2bd21a62ed1d62cddb200ec48988fba6a9b5')
sha256sums_armv7h=('13142851a73d1a503d3963dfe9df2bd21a62ed1d62cddb200ec48988fba6a9b5')
sha256sums_aarch64=('67ab7c998a4675de572ff759f80b43e8ca0b22cf1985c19a8b09ad101584963a')

prepare() {
  tar -xf data.tar.gz
  patch -p0 -i fr24feed-status.patch
}

package() {
  install -Dm755 -t "$pkgdir/usr/bin" usr/bin/fr24feed
  install -Dm755 -t "$pkgdir/usr/bin" usr/bin/fr24feed-status usr/bin/fr24uat-feed-status
  install -Dm755 -t "$pkgdir/usr/bin" usr/bin/fr24feed-signup-adsb usr/bin/fr24feed-signup-uat
  install -Dm644 usr/share/fr24/licences/LICENSE.fr24feed.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 -t "$pkgdir/etc" etc/fr24feed.ini

  install -Dm644 -t "$pkgdir/usr/lib/systemd/system" fr24feed.service fr24uat-feed.service
  install -Dm644 flightradar24.sysusers "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"

  # hostname: invalid option -- 'I'
  # Try 'hostname --help' or 'hostname --usage' for more information.
  install -Dm755 -t "$pkgdir/usr/lib/$pkgname" hostname
}

# vim:set ts=2 sw=2 et:
