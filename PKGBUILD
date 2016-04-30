# Maintainer: Patrick Wozniak <hello@patwoz.de>
# build for raspberry pi

pkgname=hyperion-rpi-bin
pkgver=20160430.fc7bc3c.v1011
pkgrel=1
pkgdesc="An opensource 'AmbiLight' implementation (build for raspberry pi) (binary)"

arch=('any')
url="https://github.com/tvdzwan/hyperion"
license=('MIT')

depends=( 'python2' )
makedepends=( 'qt4' )

conflicts=(
  'hyperion-git'
  'hyperion-rpi-git'
)

backup=(
  'etc/conf.d/hyperion.config.json'
)

source=(
  "https://raw.githubusercontent.com/tvdzwan/hyperion/V1.01.1/deploy/hyperion_rpi.tar.gz"
  "hyperiond.service"
  "LICENSE"
)
sha256sums=(
  'be992190562031b43337374d6a573f6dff76ff7d466375c1e423b41f34fd6d1d'
  'aab12fb3d901ea4c8694bd713b1a2187beae6a6ed40f3355d12fc7ad50aaf3fe'
  '85f28018f946ca13b6de640c45e011cd9fe56114d474cb990d4d1ff91ae1cd60'
)

package() {
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-rpi-bin}/LICENSE"
  install -Dm644 "hyperiond.service" "$pkgdir/usr/lib/systemd/system/hyperiond.service"

  cd "${pkgname%-rpi-bin}"


  install -Dm755 "bin/hyperiond" "$pkgdir/usr/bin/hyperiond"
  install -Dm755 "bin/hyperion-remote" "$pkgdir/usr/bin/hyperion-remote"
  install -Dm755 "bin/hyperion-v4l2" "$pkgdir/usr/bin/hyperion-v4l2"

  install -Dm644 "config/hyperion.config.json" "$pkgdir/etc/conf.d/hyperion.config.json"

  install -d "$pkgdir/opt/hyperion/"
  cp -r "effects" "$pkgdir/opt/hyperion/"
}
