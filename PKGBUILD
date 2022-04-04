# Maintainer: Thorben Günther <echo YWRtaW5AeGVucm94Lm5ldAo= | base64 -d>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
# Contributor: Maxime "pep" Buquet <archlinux@bouah.net>
pkgname=conversejs
pkgver=9.1.0
pkgrel=1
pkgdesc='Web-based XMPP/Jabber chat client written in JavaScript'
arch=('any')
url="https://conversejs.org/"
license=('custom:MPL2')
depends=("nodejs-lts-fermium")
makedepends=('git' 'npm' 'python2')
backup=('usr/share/webapps/converse.js/fullscreen.html')
source=("$pkgname-$pkgver.tar.gz::https://github.com/conversejs/converse.js/archive/v$pkgver.tar.gz")
sha256sums=('f35d0824a44839584dc8adacafee77a1b9bd2c8bf343d1b96bf17e4ec827862f')

build() {
    cd "converse.js-$pkgver"
    rm -rf dist
    make dist
}

package() {
    cd "converse.js-$pkgver"
    install -dm755 "$pkgdir"/usr/share/webapps/converse.js/
    cp -r dist "$pkgdir"/usr/share/webapps/converse.js/
    cp -r sounds "$pkgdir"/usr/share/webapps/converse.js/
    cp -r images/favicon.ico "$pkgdir"/usr/share/webapps/converse.js/dist/
    install -Dm644 fullscreen.html "$pkgdir"/usr/share/webapps/converse.js/
}
