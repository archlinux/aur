# Maintainer: Jean Lucas <jean@4ray.co>
# Contributor: Marco Pompili <aur@emarcs.org>
# Contributor: Paulo Alexandre <paulequilibrio at gmail dot com>
# Contributor: morning_star<themorningstar@riseup.net>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Parth Buch <parthbuch115 at gmail dot com>
# Contributor: Tom Vincent <http://tlvince.com/contact/>
# Contributor: Valentin Haloiu <vially.ichb+aur@gmail.com>
# Contributor: Cluxter <contact@cluxter.email>
# Contributor: Kamil Śliwak <cameel2 gmail>

pkgname=meteor-js
pkgver=1.4.4.1
pkgrel=1
pkgdesc="Meteor is a full-stack JavaScript platform for developing modern web and mobile applications"
arch=('i686' 'x86_64')
url="https://www.meteor.com"
license=('MIT')
depends=('nodejs' 'mongodb')
options=('!strip')
source_i686=("https://meteorinstall-4168.kxcdn.com/packages-bootstrap/$pkgver/meteor-bootstrap-os.linux.x86_32.tar.gz")
source_x86_64=("https://meteorinstall-4168.kxcdn.com/packages-bootstrap/$pkgver/meteor-bootstrap-os.linux.x86_64.tar.gz")
sha256sums_i686=('ef8d7dd068b485d5ffc8155d4d8e757e13cb94011fd2a00148802b88fd289437')
sha256sums_x86_64=('028f2ff188c6cae7b98654ef60c17a873fd213b62ef044fee124539de1e5ea9f')

package() {
  PREFIX="/usr/local"
  mkdir -p "$pkgdir$PREFIX/bin"
  mkdir -p "$pkgdir$HOME/.meteor"
  mv .meteor "$pkgdir$HOME"
  chown -R $USER "$pkgdir$HOME/.meteor/"
  chmod -R 755 "$pkgdir$HOME/.meteor/"

  METEOR_SYMLINK_TARGET="$(readlink "$pkgdir$HOME/.meteor/meteor")"
  METEOR_TOOL_DIRECTORY="$(dirname "$METEOR_SYMLINK_TARGET")"
  LAUNCHER="$HOME/.meteor/$METEOR_TOOL_DIRECTORY/scripts/admin/launch-meteor"
  ln -s "$LAUNCHER" "$pkgdir$PREFIX/bin/meteor"
}
