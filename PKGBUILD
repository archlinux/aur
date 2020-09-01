# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Espen Fossen <espfos@junta.no>

pkgname=nodejs-mstream
pkgver=4.6.1
pkgrel=1
pkgdesc="Music player server with a web-based interface, NPM-JS package"
arch=("any")
url="https://mstream.io"
license=("GPL3")
depends=("nodejs")
makedepends=("npm")
conflicts=("mstream-git")
install="mstream.install"
backup=("var/lib/mstream/config.json")
source=("https://registry.npmjs.org/mstream/-/mstream-$pkgver.tgz"
        "mstream.service"
        "config.json")
md5sums=('f8d978ade28d77a280e1c8112aa034f8'
         '6640e102dd29a6da5c4c075e4c4042d7'
         'a38cbd06e4077f83926e1c06f380ae83')
noextract=("mstream-$pkgver.tgz")

package(){
 npm install -g --user root --prefix "$pkgdir/usr" "mstream-$pkgver.tgz"
 install -d -g 49 -o 49 "$pkgdir/var/log/mstream"
 install -d -g 49 -o 49 "$pkgdir/var/lib/mstream"
 install -d -g 49 -o 49 "$pkgdir/var/lib/mstream/media"
 install -d -g 49 -o 49 "$pkgdir/var/lib/mstream/album-art"
 install -Dm644 "mstream.service" "$pkgdir/usr/lib/systemd/system/mstream.service"
 install -Dm644 -g 49 -o 49 "config.json" "$pkgdir/var/lib/mstream/config.json"
}
