# Maintainer: alzeih <alzeih@users.noreply.github.com>
pkgname=mod_auth_openidc
pkgver=2.4.9.2
pkgrel=1
pkgdesc="OpenID Certified™ OpenID Connect Relying Party implementation for Apache HTTP Server 2.x"
arch=('x86_64')
url="https://www.mod-auth-openidc.org/"
license=('Apache')
depends=('curl' 'cjose' 'pcre')
makedepends=('apache' 'jansson')
source=("https://github.com/zmartzone/mod_auth_openidc/archive/v$pkgver.tar.gz")
noextract=()
sha512sums=('8a024783eea43d267b3abec3277125483cfc9e764186e7210c39481f256251fcbf5450339c3e6330b333dd618eab9bfb60a4ca8929d7f98740297046c786ff56')

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

