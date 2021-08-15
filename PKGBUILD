# Maintainer: alzeih <alzeih@users.noreply.github.com>
pkgname=mod_auth_openidc
pkgver=2.4.9.1
pkgrel=1
pkgdesc="OpenID Certified™ OpenID Connect Relying Party implementation for Apache HTTP Server 2.x"
arch=('x86_64')
url="https://www.mod-auth-openidc.org/"
license=('Apache')
depends=('curl' 'cjose' 'pcre')
makedepends=('apache' 'jansson')
source=("https://github.com/zmartzone/mod_auth_openidc/archive/v$pkgver.tar.gz")
noextract=()
sha512sums=('25ad23fa9ae39ed9ff6d7a9607ef2d92ab96c4898ba9dc548418ab80652e310424c41c76ec55dccd415d1d30c271fccf7dd9f5b65f0f0b9dfa2386d242c4b0b5')

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

