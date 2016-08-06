# Maintainer: Marco Pompili <aur@emarcs.org>
# Contributor: Paulo Alexandre <paulequilibrio at gmail dot com>
# Contributor: morning_star<themorningstar@riseup.net>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Parth Buch <parthbuch115 at gmail dot com>
# Contributor: Tom Vincent <http://tlvince.com/contact/>
# Contributor: Valentin Haloiu <vially.ichb+aur@gmail.com>
# Contributor: Cluxter <contact@cluxter.email>
# Contributor: Kamil Śliwak <cameel2 gmail>

pkgname=meteor-js
pkgver=1.4.0.1
pkgrel=1
pkgdesc="Open-source JavaScript platform for building top-quality web apps in a fraction of the time."
arch=('i686' 'x86_64')
url="https://github.com/meteor/meteor"
license=('MIT')
depends=('nodejs' 'mongodb')
options=('!strip')

source_i686=("https://meteorinstall-4168.kxcdn.com/packages-bootstrap/$pkgver/meteor-bootstrap-os.linux.x86_32.tar.gz")
source_x86_64=("https://meteorinstall-4168.kxcdn.com/packages-bootstrap/$pkgver/meteor-bootstrap-os.linux.x86_64.tar.gz")

md5sums_i686=('aa34e9d6233fa523d42eec850f8d43ea')
md5sums_x86_64=('79199bfdd2a33a24e6b84d8088049dd6')

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
