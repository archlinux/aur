# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Marco A Rojas <marquicus@gmail.com>
# Contributor: Pavel Larev <pavel@larev.ws>

pkgname=apache-tools
pkgver=2.4.17
pkgrel=1
pkgdesc="Useful Apache tools - htdigest, htpasswd, ab, htdbm"
arch=("i686" "x86_64" "armv6h")
url=http://httpd.apache.org/
license=(Apache)
depends=(apr-util pcre)
conflicts=(apache)
source=(http://www.apache.org/dist/httpd/httpd-$pkgver.tar.bz2
        $pkgname-Makefile.patch)
sha256sums=('331e035dec81d3db95b048f036f4d7b1a97ec8daa5b377bde42d4ccf1f2eb798'
            '2dc48d34773b0c873d10e3542f77a4f7b50d5fb9bd8c52e3bb28b76ff9587f3f')

prepare() {
    cd httpd-$pkgver/
    patch -p1 -i ../$pkgname-Makefile.patch
}

build() {
    cd httpd-$pkgver/
    ./configure --prefix=/usr --sbindir=/usr/bin --with-pcre=/usr
    make -C support
}

package() {
    make -C httpd-$pkgver/support DESTDIR="$pkgdir" install
}
