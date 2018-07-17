# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Marco A Rojas <marquicus@gmail.com>
# Contributor: Pavel Larev <pavel@larev.ws>

pkgname=apache-tools
pkgver=2.4.34
pkgrel=1
pkgdesc="Useful Apache tools - htdigest, htpasswd, ab, htdbm"
arch=("i686" "x86_64" "armv6h" "armv7h" "aarch64")
url="http://httpd.apache.org/"
license=("Apache")
depends=("apr-util" "pcre")
makedepends=("apr-util")
conflicts=(apache)
source=(http://www.apache.org/dist/httpd/httpd-$pkgver.tar.bz2
        $pkgname-Makefile.patch
        httpd-2.4.23-openssl11.patch)
sha256sums=('fa53c95631febb08a9de41fd2864cfff815cf62d9306723ab0d4b8d7aa1638f0'
            '2dc48d34773b0c873d10e3542f77a4f7b50d5fb9bd8c52e3bb28b76ff9587f3f'
            'e87409c13feb2abd66d88cdb8c88c2cc408491adb7fd6793025a3ad2d6599a60')

prepare() {
    cd httpd-$pkgver/
    patch -p1 -i ../$pkgname-Makefile.patch
    #patch -p1 -i ../httpd-2.4.23-openssl11.patch
}

build() {
    cd httpd-$pkgver/
    ./configure --prefix=/usr --sbindir=/usr/bin --with-pcre=/usr
    make -C support
}

package() {
    make -C httpd-$pkgver/support DESTDIR="$pkgdir" install
}
