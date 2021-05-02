# Maintainer: Michael Taboada <michael@2mb.solutions>

pkgname=mymedia
pkgver=1.3.141.0
pkgrel=1
pkgdesc="Application to stream local media to amazon alexa enabled devices"
arch=('x86_64')
url="http://mymediaalexa.com"
depends=('gcc-libs')
source=("https://s3.amazonaws.com/bizmodeller/MyMediaForAlexa/Release+${pkgver}/mymedia_${pkgver}-1_amd64.deb"
  "mymedia.service")
sha512sums=('82002cb83eb16a9e6dd8f64c75f609498e2d122ee20debcb7afb5bf2bd9d2defac6be16df46736e624c9b353bf49a4df69ac762c579fa665626cd6b4cd8b18a5'
            '21cb504727dabcc435648291854d37cd53620baf3e1fd6725f33fd25a2eeda16bac76534c22e56ea70e214c4b15177ed43f7bc187dbc59f9b60aa4f857759b41')

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"

  msg2 "Removing bundled systemd files..."
  rm -r ${pkgdir}/etc

  msg2 "Installing arch systemd files..."
  install -d -m755 ${pkgdir}/usr/lib/systemd/user/
  install -m644 mymedia.service ${pkgdir}/usr/lib/systemd/user/mymedia.service
}
