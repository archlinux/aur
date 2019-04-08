# Maintainer: Jean Lucas <jean@4ray.co>
# Contributor: Robert Booster <boosterdev@linuxmail.org>
# Contributor: Marco Pompili <aur@emarcs.org>
# Contributor: Paulo Alexandre <paulequilibrio at gmail dot com>
# Contributor: morning_star<themorningstar@riseup.net>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Parth Buch <parthbuch115 at gmail dot com>
# Contributor: Tom Vincent <http://tlvince.com/contact/>
# Contributor: Valentin Haloiu <vially.ichb+aur@gmail.com>
# Contributor: Cluxter <contact@cluxter.email>
# Contributor: Kamil Śliwak <cameel2 gmail>

pkgname=meteor
pkgver=1.8.1
pkgrel=1
pkgdesc='Full-stack JavaScript platform for developing modern web and mobile applications'
arch=(i686 x86_64)
url=https://www.meteor.com
license=(MIT)
depends=(nodejs mongodb)
options=(!strip)
install=meteor.install
source_i686=(meteor-$pkgver-i686.tar.gz::https://meteorinstall-4168.kxcdn.com/packages-bootstrap/$pkgver/meteor-bootstrap-os.linux.x86_32.tar.gz)
source_x86_64=(meteor-$pkgver-x86_64.tar.gz::https://meteorinstall-4168.kxcdn.com/packages-bootstrap/$pkgver/meteor-bootstrap-os.linux.x86_64.tar.gz)
sha512sums_i686=('e7b7f814e94b247afcb7cabdaec6a3f830fc3a421e056a0ce2118871e027f3fc2325000bf303a20c79ead47160a96b111a7708d508f9e9a72ac8d8930092c42a')
sha512sums_x86_64=('c92d1e529741a7b8c6dccb2db50096d05546e15d80294e2cc42ae7596d54d4813415a660c3a64c741f58dadd6387bc9aa7448fc6afee5e2c81e0dd4c31bb55e1')

package() {
  install -d "$pkgdir"/usr/{share,bin}

  # Copy base Meteor tree to universally-accessible location
  cp -a .meteor "$pkgdir"/usr/share/meteor

  # Create our executable
  cat > "$pkgdir"/usr/bin/meteor << EOF
#!/bin/sh

if [ ! -d "\$HOME"/.meteor ]; then
  mkdir "\$HOME"/.meteor
  cp -r /usr/share/meteor/* "\$HOME"/.meteor
fi

"\$HOME"/.meteor/meteor "\$@"
EOF
}
