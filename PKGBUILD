# Maintainer: Thorben Günther <echo YWRtaW5AeGVucm94Lm5ldAo= | base64 -d>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
# Contributor: Maxime "pep" Buquet <archlinux@bouah.net>
pkgname=conversejs
pkgver=8.0.1
pkgrel=1
pkgdesc='Web-based XMPP/Jabber chat client written in JavaScript'
arch=('any')
url="https://conversejs.org/"
license=('custom:MPL2')
depends=("nodejs-lts-fermium")
makedepends=('git' 'npm' 'python2')
backup=('usr/share/webapps/converse.js/fullscreen.html')
source=("$pkgname-$pkgver.tar.gz::https://github.com/conversejs/converse.js/archive/v$pkgver.tar.gz")
sha256sums=('6f6950a8990b7e341a7cd73244532a3a9683c648637d6470ebefd81f7094be77')

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
