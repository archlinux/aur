# Maintainer: alzeih <alzeih@users.noreply.github.com>
pkgname=mod_auth_openidc
pkgver=2.4.9.3
pkgrel=1
pkgdesc="OpenID Certified™ OpenID Connect Relying Party implementation for Apache HTTP Server 2.x"
arch=('x86_64')
url="https://www.mod-auth-openidc.org/"
license=('Apache')
depends=('curl' 'cjose' 'pcre')
makedepends=('apache' 'jansson')
source=("https://github.com/zmartzone/mod_auth_openidc/archive/v$pkgver.tar.gz")
noextract=()
sha512sums=('b067355585bbd3fccde83d3b37c65e2f653d76793b02bd81d9561a048e7acceab6e781342f0c41025208fd69872a85768e331d04770a09692f587bfa6d2723b2')

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

