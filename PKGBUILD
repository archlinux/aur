# Maintainer: Tad Fisher <tadfisher at gmail dot com>

_npmname=pass-server-node
pkgname=nodejs-pass-server-node
pkgver=0.3.0
pkgrel=1
pkgdesc="Read-only portal to pass, the standard password manager"
arch=('any')
url="https://github.com/cpoppema/pass-server-node"
license=('GPL3')
depends=('npm')
optdepends=()
makedepends=()
install=$pkgname.install
source=(https://github.com/cpoppema/pass-server-node/archive/v0.3.0.tar.gz
	'pass-server-node.service')
md5sums=('742c4cc62b478ab39b3942bc3801d534'
         '4e7a1f04f5088a0db7f34508866076ae')

package() {
    local _npmdir="$pkgdir/usr/lib/node_modules/"
    mkdir -p "$_npmdir"
    cd $_npmdir
    npm install -g --prefix "$pkgdir/usr" $srcdir/$_npmname-$pkgver
    install -Dm644 "${srcdir}/pass-server-node.service" "${pkgdir}/usr/lib/systemd/user/pass-server-node.service"

    # Cleanup npm crap
    rmdir $pkgdir/usr/etc
}
