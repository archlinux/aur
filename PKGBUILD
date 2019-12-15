# Maintainer: robertfoster

pkgname=peerflix-server
pkgver=0.5.1
pkgrel=1
pkgdesc="Streaming torrent client for node.js with web ui"
arch=('i686' 'x86_64')
url="https://github.com/asapach/peerflix-server"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=($pkgname.service
	$pkgname.sh
)
conflicts=('peerflix-server-git')
options=('!strip')

package(){
    cd $srcdir
    local _npmdir="$pkgdir/usr/lib/node_modules/"
    mkdir -p $_npmdir
    cd $_npmdir
    npm install -g --prefix "$pkgdir/usr" --ignore-scripts --production $pkgname@$pkgver

    install -Dm644 "${srcdir}/$pkgname.service" "${pkgdir}/usr/lib/systemd/system/$pkgname.service"
    install -Dm775 "${srcdir}/peerflix-server.sh" "${pkgdir}/usr/bin/peerflix-server"
}
md5sums=('c16f83bd40fe9905b51c3ffd073bbcd0'
         'ea9702820f92bef0636a4f01d13dd348')
