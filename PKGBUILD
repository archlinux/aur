# Maintainer: Jan Philipp Bamberger <aur@bamberger.it>
# Contributor: Thorben Günther <echo YWRtaW5AeGVucm94Lm5ldAo= | base64 -d>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
# Contributor: Maxime "pep" Buquet <archlinux@bouah.net>
pkgname=conversejs
pkgver=12.0.0
pkgrel=1
pkgdesc='Web-based XMPP/Jabber chat client written in JavaScript'
arch=('any')
url="https://conversejs.org/"
license=('custom:MPL2')
depends=("nodejs")
makedepends=('npm' 'python')
backup=('usr/share/webapps/converse.js/fullscreen.html')
source=("$pkgname-$pkgver.tar.gz::https://github.com/conversejs/converse.js/archive/v$pkgver.tar.gz")
sha256sums=('31e28fe83e71697b1c6d8af69ce915b4cc52c5f0f629a84c4401ab2ab6025aea')

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
    install -Dm644 manifest.json "$pkgdir"/usr/share/webapps/converse.js/
}
