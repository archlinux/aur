# Maintainer: alzeih <alzeih@users.noreply.github.com>
pkgname=mod_auth_openidc
pkgver=2.4.7
pkgrel=1
pkgdesc="An authentication/authorization module for the Apache 2.x HTTP server that functions as an OpenID Connect Relying Party, authenticating users against an OpenID Connect Provider."
arch=('x86_64')
url="https://www.mod-auth-openidc.org/"
license=('Apache')
depends=('curl' 'cjose' 'pcre')
makedepends=('apache' 'jansson')
source=("https://github.com/zmartzone/mod_auth_openidc/archive/v$pkgver.tar.gz")
noextract=()
sha512sums=('7c993995d5d4cf59b918302c375750b6bde0c47bfc5b020e0d70b7a8841d53f3a0861beeb9d334a52a3f3b3ac1f26aa6876cee8e523d73c2af5a6603f9e554b7')

build() {
        cd "$pkgname-$pkgver"
        ./autogen.sh
        APXS2_OPTS="-S LIBEXECDIR=$pkgdir/usr/lib/httpd/modules/" ./configure --prefix=/usr
        make
}

package() {
        cd "$pkgname-$pkgver"
        install -dm755 "$pkgdir/usr/lib/httpd/modules"
        make install
}

