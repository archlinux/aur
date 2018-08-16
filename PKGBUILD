# Maintainer: robertfoster

pkgname=peerflix-server
pkgver=0.3.1
pkgrel=1
pkgdesc="Streaming torrent client for node.js with web ui"
arch=('i686' 'x86_64')
url="https://github.com/asapach/peerflix-server"
license=('MIT')
depends=('nodejs')
makedepends=('nodejs-grunt-cli' 'bower' 'npm')
source=(peerflix-server.sh
peerflix-server.service)
conflicts=('peerflix-server-git')
options=('!strip')

package(){
    cd $srcdir
    local _npmdir="$pkgdir/usr/lib/node_modules/"
    mkdir -p $_npmdir
    cd $_npmdir
    npm install -g --prefix "$pkgdir/usr" --ignore-scripts --production peerflix-server@$pkgver

    install -Dm644 "${srcdir}/peerflix-server.service" "${pkgdir}/usr/lib/systemd/system/peerflix-server.service"
    install -Dm775 "${srcdir}/peerflix-server.sh" "${pkgdir}/usr/bin/peerflix-server"
}

md5sums=('ea9702820f92bef0636a4f01d13dd348'
'8eb4184190cd66435c3bda2435982422')
