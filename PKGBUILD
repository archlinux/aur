# Maintainer: Patrick Wozniak <hello@patwoz.de>
# build for raspberry pi

pkgname=hyperion-rpi-bin
pkgver=20160725.d3713a8.V1032
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
  "etc/${pkgname%-rpi-bin}/${pkgname%-rpi-bin}.config.json"
)

source=(
  "http://tenet.dl.sourceforge.net/project/hyperion-project/release/${pkgname%-rpi-bin}_rpi.tar.gz"
  "LICENSE"
)
sha256sums=(
  '27663af04ba2c094748db043b6ff0cce36fb24db39521018caf0869cf6474ebe'
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
