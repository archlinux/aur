# Maintainer: Yuval Adam <yuval at y3xz dot com> PGP-Key: 271386AA2EB7672F

pkgname=flightradar24
pkgver=1.0.18
_pkgverorig=1.0.18-5
_pkgverorigarmhf=1.0.18-7
pkgrel=2
pkgdesc="Feeder software for Flightradar24.com"
url="http://forum.flightradar24.com/threads/7563-Flightradar24-decoder-feeder-BETA-testing-%28Win-RPi-Linux-OSX%29"
arch=('x86_64' 'i686' 'armv6h' 'armv7h')
license=('unknown')
depends=('zlib' 'gcc-libs')
install=flightradar24.install
optdepends=('dump1090-git: for dump1090 in RasppberyPi')

source=(fr24feed.service flightradar24.tmpfiles flightradar24.sysusers)
sha256sums=(
  'd27654efb9ce273ac117582b7b36d997d86a3843b2c77faf6f6fd131d3df1635'
  '32f6f289efe8e3e303767239b2a276405b2d7c0fcbbde8ed9473ee6889b676ff'
  '7e5e1a28769559a2e2e1312894a1f9d315c4812bb34e2f1c45b2f877e4f4eeb0'
)

source_i686=("http://feed.flightradar24.com/linux/fr24feed_${_pkgverorig}_i386.tgz")
sha256sums_i686=('9d80b8a6fe55fc70b3b8e773e3d07d61ceee95c41db50a682eaab208abd3a391')

source_x86_64=("http://feed.flightradar24.com/linux/fr24feed_${_pkgverorig}_amd64.tgz")
sha256sums_x86_64=('770e86b640bcbb8850df67aaa8072a85ac941e2e2f79ea25ef44d67e89bc5649')

source_armv6h=("http://repo.feed.flightradar24.com/rpi_binaries/fr24feed_${_pkgverorigarmhf}_armhf.tgz")
sha256sums_armv6h=('84c690234dc84e0fe7566a3f70f99633e1be1aca02102dadc5d988708b854f40')

source_armv7h=("http://repo.feed.flightradar24.com/rpi_binaries/fr24feed_${_pkgverorigarmhf}_armhf.tgz")
sha256sums_armv7h=('84c690234dc84e0fe7566a3f70f99633e1be1aca02102dadc5d988708b854f40')

package() {
  cd "$srcdir"
  if [[ $CARCH = "i686" ]]; then
    pushd fr24feed_i386
  elif [[ $CARCH = "x86_64" ]]; then
    pushd fr24feed_amd64
  elif [[ $CARCH = "armv6h" ]]; then
    pushd fr24feed_armhf
  elif [[ $CARCH = "armv7h" ]]; then
    pushd fr24feed_armhf
  fi

  install -Dm755 fr24feed "$pkgdir/usr/bin/fr24feed"
  install -Dm644 LICENSE.fr24feed "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
  popd

  install -Dm644 fr24feed.service "$pkgdir/usr/lib/systemd/system/fr24feed.service"
  install -Dm644 flightradar24.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/flightradar24.conf"
  install -Dm644 flightradar24.sysusers "$pkgdir/usr/lib/sysusers.d/flightradar24.conf"
}

# vim:set ts=2 sw=2 et:
