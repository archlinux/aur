# Maintainer: Yuval Adam <yuval at y3xz dot com> PGP-Key: 271386AA2EB7672F

pkgname=flightradar24
pkgver=1.0.13
pkgrel=5
pkgdesc="Feeder software for Flightradar24.com"
url="http://forum.flightradar24.com/threads/7563-Flightradar24-decoder-feeder-BETA-testing-%28Win-RPi-Linux-OSX%29"
arch=('x86_64' 'i686' 'armv6h' 'armv7h')
license=('unknown')
depends=('zlib' 'gcc-libs')
install=flightradar24.install

source=(fr24feed.service flightradar24.tmpfiles flightradar24.sysusers)
sha256sums=(
  '42488de23b25a9f8c3586a1f834972d54ddb669867a27c641b55c718459a841d'
  '32f6f289efe8e3e303767239b2a276405b2d7c0fcbbde8ed9473ee6889b676ff'
  '7e5e1a28769559a2e2e1312894a1f9d315c4812bb34e2f1c45b2f877e4f4eeb0'
)

source_i686=("http://feed.flightradar24.com/linux/fr24feed_${pkgver}-2_i386.tgz")
sha256sums_i686=('d5a59d2837a65334ab8ff760c749b4da5f721030f8b441dc28a5f4c20a56e2f9')

source_x86_64=("http://feed.flightradar24.com/linux/fr24feed_${pkgver}-2_amd64.tgz")
sha256sums_x86_64=('71a43fd6de5e033af59ca989b85e7c724d3aace26eb11b629dab4088a3321f6c')

source_armv6h=("http://feed.flightradar24.com/raspberry-pi/fr24feed_${pkgver}-2_armv6l.tgz")
sha256sums_armv6h=('dddd8feaa5c603acf81ab00aca7dd71f4a4cec46c83cf02eaab050e1f67501ed')

source_armv7h=("http://feed.flightradar24.com/raspberry-pi/fr24feed_${pkgver}-2_armv7l.tgz")
sha256sums_armv7h=('ab54ce2ff14bceca43e28bec387d0309f8e64fe7853a6cbc6a1cb85110696ef1')

package() {
  cd "$srcdir"
  if [[ $CARCH = "i686" ]]; then
    pushd fr24feed_i386
  elif [[ $CARCH = "x86_64" ]]; then
    pushd fr24feed_amd64
  elif [[ $CARCH = "armv6h" ]]; then
    pushd fr24feed_armv6l
  elif [[ $CARCH = "armv7h" ]]; then
    pushd fr24feed_armv7l
  fi

  install -Dm755 fr24feed "$pkgdir/usr/bin/fr24feed"
  install -Dm644 LICENSE.fr24feed "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
  popd

  install -Dm644 fr24feed.service "$pkgdir/usr/lib/systemd/system/fr24feed.service"
  install -Dm644 flightradar24.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/flightradar24.conf"
  install -Dm644 flightradar24.sysusers "$pkgdir/usr/lib/sysusers.d/flightradar24.conf"
}

# vim:set ts=2 sw=2 et:
