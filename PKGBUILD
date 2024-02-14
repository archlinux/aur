# Maintainer: Jimmy Xu <me at jimmyxu dot org>
# Contributor: Assaf Sapir <meijin007 at gmail dot com>
# Contributor: Yuval Adam <yuval at y3xz dot com>

pkgname=flightradar24
_pkgname=fr24feed
pkgver=1.0.46
pkgrel=2
_pkgver=1.0.46-2
_pkgverarm=1.0.46-2
pkgdesc='Feeder software for Flightradar24.com (fr24feed)'
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'aarch64')
url='https://www.flightradar24.com/share-your-data'
license=('custom')
depends=('bash' 'dump1090')
backup=(etc/fr24feed.ini)
install=flightradar24.install
source=('fr24feed.service'
        'flightradar24.sysusers'
        'fr24feed-status.patch'
        'hostname')
source_x86_64=("https://repo-feed.flightradar24.com/linux_binaries/${_pkgname}_${_pkgver}_amd64.deb")
source_i686=("https://repo-feed.flightradar24.com/linux_binaries/${_pkgname}_${_pkgver}_i386.deb")
source_armv6h=("https://repo-feed.flightradar24.com/rpi_binaries/${_pkgname}_${_pkgverarm}_armhf.deb")
source_armv7h=("https://repo-feed.flightradar24.com/rpi_binaries/${_pkgname}_${_pkgverarm}_armhf.deb")
source_aarch64=("https://repo-feed.flightradar24.com/rpi_binaries/${_pkgname}_${_pkgverarm}_armhf.deb")

sha256sums=('857383cd88daac429f25579d40cc5c4f3c4468f2af406cba70d3d7e9fe825cd3'
            'a018c751e431fcde72e709917fdfe663a5c74040af80b56d1a4658ba962c95e5'
            'ebcf31ecb62aef650b0984f978318f7e716078f520efb165306dca592c0821bb'
            '32ae61984ae0123690fea0bf67f2b5f1ee1155f6a2b3a9d0ff7c5431d902ddee')
sha256sums_x86_64=('c5e7ba85ee638d1d94394fdcce1a7c3b246d963b0aef28441606130d82d389f1')
sha256sums_i686=('d6b8ea6f44ce87674acc1068f4c1446c6046c22397539a618622e95b2925f671')
sha256sums_armv6h=('32e06ea0d87c686049ed47ac63c05b6d91ca85b4e5a3dc4ab6e53664b66d4768')
sha256sums_armv7h=('32e06ea0d87c686049ed47ac63c05b6d91ca85b4e5a3dc4ab6e53664b66d4768')
sha256sums_aarch64=('32e06ea0d87c686049ed47ac63c05b6d91ca85b4e5a3dc4ab6e53664b66d4768')

prepare() {
  tar -xf data.tar.gz
  patch -p0 -i fr24feed-status.patch
}

package() {
  install -Dm755 -t "$pkgdir/usr/bin" usr/bin/fr24feed usr/bin/fr24feed-status
  install -Dm644 usr/share/fr24/licences/LICENSE.fr24feed.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 -t "$pkgdir/etc" etc/fr24feed.ini

  install -Dm644 -t "$pkgdir/usr/lib/systemd/system" fr24feed.service
  install -Dm644 flightradar24.sysusers "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"

  # hostname: invalid option -- 'I'
  # Try 'hostname --help' or 'hostname --usage' for more information.
  install -Dm755 -t "$pkgdir/usr/lib/$pkgname" hostname
}

# vim:set ts=2 sw=2 et:
