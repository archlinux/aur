# Maintainer: Paulo Alexandre <paulequilibrio at gmail dot com>
# Contributor: Kamil Śliwak <cameel2 gmail>
# Contributor: morning_star<themorningstar@riseup.net>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Parth Buch <parthbuch115 at gmail dot com>
# Contributor: Tom Vincent <http://tlvince.com/contact/>
# Contributor: Valentin Haloiu <vially.ichb+aur@gmail.com>
# Contributor: Cluxter <contact@cluxter.email>

pkgname=meteor-js
pkgver=1.3
pkgrel=4
pkgdesc="Open-source JavaScript platform for building top-quality web apps in a fraction of the time."

arch=('i686' 'x86_64')
url="https://github.com/meteor/meteor"
license=('MIT')
depends=('nodejs' 'mongodb')
makedepends=('sed')
options=('!strip')

source_i686=("https://d3sqy0vbqsdhku.cloudfront.net/packages-bootstrap/$pkgver/meteor-bootstrap-os.linux.x86_32.tar.gz")
source_x86_64=("https://d3sqy0vbqsdhku.cloudfront.net/packages-bootstrap/$pkgver/meteor-bootstrap-os.linux.x86_64.tar.gz")

md5sums_i686=('19b9e31626c9dc35ece52fe0e88e84f6')
md5sums_x86_64=('2cef5e7a5f8a62d45927d48691e65a1e')

package() {
    mkdir -p "$pkgdir/opt/meteor-js"
    mv .meteor "$pkgdir/opt/meteor-js/.meteor"
    mkdir -p "$pkgdir/usr/bin/"

    METEOR_SYMLINK_TARGET="$(readlink "$pkgdir/opt/meteor-js/.meteor/meteor")"
    METEOR_TOOL_DIRECTORY="$(dirname "$METEOR_SYMLINK_TARGET")"
    LAUNCHER="$pkgdir/opt/meteor-js/.meteor/$METEOR_TOOL_DIRECTORY/scripts/admin/launch-meteor"
    sed -i 's/\$HOME/\/opt\/meteor\-js/g' $LAUNCHER
    sed -i 's/your home/\/opt\/meteor\-js/g' $LAUNCHER
    cp "$LAUNCHER" "$pkgdir/usr/bin/meteor"
}
