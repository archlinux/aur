# Maintainer: alzeih <alzeih@users.noreply.github.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=mod_auth_openidc
pkgver=2.4.10
pkgrel=1
pkgdesc="OpenID Connect Relying Party implementation for Apache 2.x"
arch=('x86_64')
url="https://www.mod-auth-openidc.org/"
license=('Apache')
depends=('curl' 'cjose' 'pcre')
makedepends=('apache' 'jansson')
source=("https://github.com/zmartzone/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('5e2b587d7cbae290242aec8d94047c64061c2554d9458be6085bdb643d447feb48d56748198ade1de390cd4babdaf81d9e1f5e06d5a05ce8d164520c4f5a1ca7')

prepare() {
        cd "$pkgname-$pkgver"
        # switch installation methods, the one we need is commented
        sed -i -e '72d;73{s/^.//;s/@/$(DESTDIR)@/}' Makefile.am
}

build() {
        cd "$pkgname-$pkgver"
        ./configure --prefix=/usr
        make
}

package() {
        cd "$pkgname-$pkgver"
        make install DESTDIR="$pkgdir"
}

