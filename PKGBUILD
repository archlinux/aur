# Maintainer: alzeih <alzeih@users.noreply.github.com>
pkgname=mod_auth_openidc
pkgver=2.4.3
pkgrel=1
pkgdesc="An authentication/authorization module for the Apache 2.x HTTP server that functions as an OpenID Connect Relying Party, authenticating users against an OpenID Connect Provider."
arch=('x86_64')
url="https://www.mod-auth-openidc.org/"
license=('Apache')
depends=('curl' 'cjose' 'pcre')
makedepends=('apache' 'jansson')
source=("https://github.com/zmartzone/mod_auth_openidc/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
noextract=()
sha512sums=('c4fa4f99f2005cab230f4b8a3dd70cc99c281fc4ff679472f0c1a5920372b53ce2b5e34a8f87e14fc92055d3b9c75dd58f77f539f69571a1af0db10bdc6ea1ab')

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

