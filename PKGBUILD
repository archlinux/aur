# Maintainer: Jimmy Xu <me at jimmyxu dot org>
# Contributor: Assaf Sapir <meijin007 at gmail dot com>
# Contributor: Yuval Adam <yuval at y3xz dot com>

pkgname=flightradar24
_pkgname=fr24feed
pkgver=1.0.24
pkgrel=6
_pkgver=1.0.24-5
_pkgverarm=1.0.24-6
pkgdesc='Feeder software for Flightradar24.com'
arch=('x86_64' 'i686' 'armv6h' 'armv7h')
url='https://www.flightradar24.com/share-your-data'
license=('custom')
depends=()
optdepends=('dump1090-git: for dump1090 in RasppberyPi')
backup=(etc/fr24feed.ini)
install=flightradar24.install
source=('fr24feed.service'
        'flightradar24.tmpfiles'
        'flightradar24.sysusers')
source_x86_64=("https://repo-feed.flightradar24.com/linux_x86_64_binaries/${_pkgname}_${_pkgver}_amd64.tgz")
source_i686=("https://repo-feed.flightradar24.com/linux_x86_binaries/${_pkgname}_${_pkgver}_i386.tgz")
source_armv6h=("https://repo-feed.flightradar24.com/rpi_binaries/${_pkgname}_${_pkgverarm}_armhf.tgz")
source_armv7h=("https://repo-feed.flightradar24.com/rpi_binaries/${_pkgname}_${_pkgverarm}_armhf.tgz")

sha256sums=('7c0d1a5508917851789477b035cd91eafb84f8706c3214babea7125f8a82a0d2'
            '32f6f289efe8e3e303767239b2a276405b2d7c0fcbbde8ed9473ee6889b676ff'
            '7e5e1a28769559a2e2e1312894a1f9d315c4812bb34e2f1c45b2f877e4f4eeb0')
sha256sums_x86_64=('cc88150f753e734327bf35574f6de5b11d8f989ddb1186514a4ce02e6e61600b')
sha256sums_i686=('68dc31cf7f085074d1c639fe8bf383dc614704a0c526d98a6ab52a32f1833f9d')
sha256sums_armv6h=('09e0ef461ea592097817324ef2b33add6c37f9c6e03cdf47c5ea6cd3960e9280')
sha256sums_armv7h=('09e0ef461ea592097817324ef2b33add6c37f9c6e03cdf47c5ea6cd3960e9280')

package() {
  case $CARCH in
  i686)
    pushd ${_pkgname}_i386
    ;;
  x86_64)
    pushd ${_pkgname}_amd64
    ;;
  arm*)
    pushd ${_pkgname}_armhf
    ;;
  esac

  install -Dm755 -t "$pkgdir/usr/bin" fr24feed
  install -Dm644 licences/LICENSE.fr24feed.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  popd

  install -Dm644 -t "$pkgdir/usr/lib/systemd/system" fr24feed.service
  install -Dm644 flightradar24.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
  install -Dm644 flightradar24.sysusers "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
}

# vim:set ts=2 sw=2 et:
