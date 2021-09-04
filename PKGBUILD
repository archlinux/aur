# Maintainer: alzeih <alzeih@users.noreply.github.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=mod_auth_openidc
pkgver=2.4.9.4
pkgrel=3
pkgdesc="OpenID Connect Relying Party implementation for Apache 2.x"
arch=('x86_64')
url="https://www.mod-auth-openidc.org/"
license=('Apache')
depends=('curl' 'cjose' 'pcre')
makedepends=('apache' 'jansson')
source=("https://github.com/zmartzone/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('755f3343f87cd1b05d16e60afc86b68a79657adf793863215fba1bce6a12b8b7b18f60fba5041f82601d3ab2d526287ff3f88fef33673e84456d0423a90b1977')

build() {
        cd "$pkgname-$pkgver"
        APXS2_OPTS="-S LIBEXECDIR=$pkgdir/usr/lib/httpd/modules/" ./configure --prefix=/usr
        make
}

package() {
        cd "$pkgname-$pkgver"
        # Upstream Issue: https://github.com/zmartzone/mod_auth_openidc/issues/674
        install -dm755 "$pkgdir/usr/lib/httpd/modules"
        make install
}

