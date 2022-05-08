# Maintainer: Thorben Günther <echo YWRtaW5AeGVucm94Lm5ldAo= | base64 -d>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
# Contributor: Maxime "pep" Buquet <archlinux@bouah.net>
pkgname=conversejs
pkgver=9.1.1
pkgrel=1
pkgdesc='Web-based XMPP/Jabber chat client written in JavaScript'
arch=('any')
url="https://conversejs.org/"
license=('custom:MPL2')
depends=("nodejs-lts-fermium")
makedepends=('git' 'npm' 'python2')
backup=('usr/share/webapps/converse.js/fullscreen.html')
source=("$pkgname-$pkgver.tar.gz::https://github.com/conversejs/converse.js/archive/v$pkgver.tar.gz")
sha256sums=('30deec8849013262cf347cac93f00c219a4ed6a60b62f288aa4974cf69623a13')

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
