# Maintainer: Jimmy Xu <me at jimmyxu dot org>
# Contributor: Assaf Sapir <meijin007 at gmail dot com>
# Contributor: Yuval Adam <yuval at y3xz dot com>

pkgname=flightradar24
_pkgname=fr24feed
pkgver=1.0.29
pkgrel=4
_pkgver=1.0.25-3
_pkgverarm=1.0.29-10
pkgdesc='Feeder software for Flightradar24.com (fr24feed)'
arch=('x86_64' 'i686' 'armv6h' 'armv7h')
url='https://www.flightradar24.com/share-your-data'
license=('custom')
depends=('bash' 'dump1090')
backup=(etc/fr24feed.ini)
install=flightradar24.install
source=('fr24feed.service'
        'flightradar24.sysusers'
        'fr24feed-status.patch'
        'hostname')
source_x86_64=("https://repo-feed.flightradar24.com/linux_x86_64_binaries/${_pkgname}_${_pkgver}_amd64.deb")
source_i686=("https://repo-feed.flightradar24.com/linux_x86_binaries/${_pkgname}_${_pkgver}_i386.deb")
source_armv6h=("https://repo-feed.flightradar24.com/rpi_binaries/${_pkgname}_${_pkgverarm}_armhf.deb")
source_armv7h=("https://repo-feed.flightradar24.com/rpi_binaries/${_pkgname}_${_pkgverarm}_armhf.deb")

sha256sums=('857383cd88daac429f25579d40cc5c4f3c4468f2af406cba70d3d7e9fe825cd3'
            'a018c751e431fcde72e709917fdfe663a5c74040af80b56d1a4658ba962c95e5'
            'ebcf31ecb62aef650b0984f978318f7e716078f520efb165306dca592c0821bb'
            '32ae61984ae0123690fea0bf67f2b5f1ee1155f6a2b3a9d0ff7c5431d902ddee')
sha256sums_x86_64=('cf9ffe50754b1de482d7d9154b5b9d1c251ef2c15564427d176428b4afaef399')
sha256sums_i686=('a74f109ca8d8c9180b07830a366dba909335d5fa4db1c3bb6c8d259cd6e56d2f')
sha256sums_armv6h=('529e9d099c95c4a09b55819f491b49a8390d41f20607ff40b40f78fb02e67104')
sha256sums_armv7h=('529e9d099c95c4a09b55819f491b49a8390d41f20607ff40b40f78fb02e67104')

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
