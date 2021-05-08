# Maintainer: alzeih <alzeih@users.noreply.github.com>
pkgname=mod_auth_openidc
pkgver=2.4.8.2
pkgrel=1
pkgdesc="An authentication/authorization module for the Apache 2.x HTTP server that functions as an OpenID Connect Relying Party, authenticating users against an OpenID Connect Provider."
arch=('x86_64')
url="https://www.mod-auth-openidc.org/"
license=('Apache')
depends=('curl' 'cjose' 'pcre')
makedepends=('apache' 'jansson')
source=("https://github.com/zmartzone/mod_auth_openidc/archive/v$pkgver.tar.gz")
noextract=()
sha512sums=('5c8750c1e39eadba4bfef5a3769240e3c7a78a3116adcd852de4a62152405491953f0e625d81aaf26a3bc35917370a2ff1abbc22d64d7af564f060601eae655c')

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

