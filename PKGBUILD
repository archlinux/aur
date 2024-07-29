# Maintainer: Ranieri Althoff <ranisalt+aur at gmail dot com>
# Contributor: Jimmy Xu <me at jimmyxu dot org>
# Contributor: Assaf Sapir <meijin007 at gmail dot com>
# Contributor: Yuval Adam <yuval at y3xz dot com>

pkgname=flightradar24
_pkgname=fr24feed
pkgver=1.0.48
pkgrel=3
_pkgver=1.0.48-0
_pkgverarm=1.0.48-0
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
        'fr24feed-status.patch'
        'hostname')
source_x86_64=("https://repo-feed.flightradar24.com/linux_binaries/${_pkgname}_${_pkgver}_amd64.deb")
source_i686=("https://repo-feed.flightradar24.com/linux_binaries/${_pkgname}_${_pkgver}_i386.deb")
source_armv6h=("https://repo-feed.flightradar24.com/rpi_binaries/${_pkgname}_${_pkgverarm}_armhf.deb")
source_armv7h=("https://repo-feed.flightradar24.com/rpi_binaries/${_pkgname}_${_pkgverarm}_armhf.deb")
source_aarch64=("https://repo-feed.flightradar24.com/rpi_binaries/${_pkgname}_${_pkgverarm}_armhf.deb")

sha256sums=('2cdddccd3133e435068b067da89068b4fe974a1078b85bb41affc3b60592eff6'
            '6f4da99fcd98672ab02c92042db512ff36438e2777b52d6bccda8d7c83287e54'
            'ebcf31ecb62aef650b0984f978318f7e716078f520efb165306dca592c0821bb'
            '32ae61984ae0123690fea0bf67f2b5f1ee1155f6a2b3a9d0ff7c5431d902ddee')
sha256sums_x86_64=('bc965be30314c472619df2dd1961171042dea5b0c887396ca7fb47c86c7ec9ad')
sha256sums_i686=('7a3b88ab7bb67f1ac1eec8352490d2454988e6aed77416c57b59373c4e469d59')
sha256sums_armv6h=('d69afac856dc22f18c8378a51bdc27260459f2c26960dc88ed05ffc944e81ef7')
sha256sums_armv7h=('d69afac856dc22f18c8378a51bdc27260459f2c26960dc88ed05ffc944e81ef7')
sha256sums_aarch64=('d69afac856dc22f18c8378a51bdc27260459f2c26960dc88ed05ffc944e81ef7')

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

  # hostname: invalid option -- 'I'
  # Try 'hostname --help' or 'hostname --usage' for more information.
  install -Dm755 -t "$pkgdir/usr/lib/$pkgname" hostname
}

# vim:set ts=2 sw=2 et:
