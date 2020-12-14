# Maintainer: Marius Kleber <marius at kleberonline dot de>

pkgname=apache-modsecurity-git
_pkgname=ModSecurity-apache
pkgver=r123.2368a66
pkgrel=1
pkgdesc='ModSecurity v3 Apache Connector (module for Apache)'
arch=('x86_64')
depends=('libmodsecurity')
makedepends=('git')
url="https://github.com/SpiderLabs/ModSecurity-apache.git"
license=('Apache')
source=("git+https://github.com/SpiderLabs/ModSecurity-apache.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$_pkgname"

    autoreconf -fi
}

build() {
    cd "$_pkgname"

    ./configure --with-libmodsecurity=/usr
    make        
}

package() {
    install -Dm755 "$_pkgname"/src/.libs/*.so -t "$pkgdir/usr/lib/httpd/modules/"
}
