# Current Maintainer : Matthew Hague <matthewhague@zoho.com>
# Original Maintainer : a-sk <askurihin at gmail dot com>
_npmname=imapnotify
pkgname=nodejs-$_npmname
pkgver=0.4.1
pkgrel=10
pkgdesc="Execute scripts on new messages using IDLE imap command"
arch=(any)
url="https://github.com/titibandit/node-imapnotify"
license=(MIT)
depends=('nodejs')
source=($pkgname::git+https://github.com/titibandit/node-imapnotify
        imapnotify@.service)
optdepends=()
makedepends=('npm')
install=$pkgname.install
sha1sums=(SKIP
          1e82f19dffcfc2db30047f6788a91a1f9a138a65)

package() {
    local _npmdir="$pkgdir/usr/lib/node_modules/"
    mkdir -p $_npmdir
    cd $srcdir/$pkgname
    npm pack
    npm install --cache "${srcdir}/npm-cache" -g --prefix "$pkgdir/usr" "${_npmname}-${pkgver}.tgz"
    install -Dm644 "${srcdir}/imapnotify@.service" "${pkgdir}/usr/lib/systemd/user/imapnotify@.service"
}
