# Maintainer: Patrick Wozniak <hello@patwoz.de>
# build for raspberry pi

pkgname=hyperion-rpi-bin
pkgver=20160614.b8f7642.V1030
pkgrel=2
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
  "etc/${pkgname%-rpi-bin}/${pkgname%-rpi-bin}.config.json"
)

source=(
  "http://tenet.dl.sourceforge.net/project/hyperion-project/release/${pkgname%-rpi-bin}_rpi.tar.gz"
  "LICENSE"
)
sha256sums=(
  '8ba700d59aec256fe510091042cf7fa61daed95f3ea7c0ab2a4a4d650e26873d'
  '85f28018f946ca13b6de640c45e011cd9fe56114d474cb990d4d1ff91ae1cd60'
)

package() {
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-rpi-bin}/LICENSE"

  cd "${pkgname%-rpi-bin}"

  install -Dm644 "config/${pkgname%-rpi-bin}.config.json.example" "$pkgdir/etc/${pkgname%-rpi-bin}/${pkgname%-rpi-bin}.config.json"
  install -Dm644 "services/${pkgname%-rpi-bin}.systemd.sh" "$pkgdir/usr/lib/systemd/system/${pkgname%-rpi-bin}d.service"

  mkdir -p "$pkgdir/usr/bin/"
  cp -r "bin" "$pkgdir/usr/"

  mkdir -p "$pkgdir/opt/${pkgname%-rpi-bin}/effects/"
  cp -r "effects" "$pkgdir/opt/${pkgname%-rpi-bin}/"
}
