# Maintainer: Felipe BF <fprgw32 at gmail dot com>
# Contributor: Sebastian Reuße <seb@wirrsal.net>

_name=pixterm
pkgname="${_name}-git"
epoch=1
pkgver=1.3.3.r0.g24a1aed
pkgrel=1
pkgdesc="Draw images in your ANSI terminal with true color"
arch=(x86_64 i686)
url=https://github.com/eliukblau/pixterm
license=(MPL-2.0)
provides=(pixterm)
conflicts=(pixterm)
depends=(glibc)
makedepends=(git go)

source=(git+https://github.com/eliukblau/pixterm)
md5sums=(SKIP)

pkgver() {
    cd "$_name"
    git describe --long --tags | sed 's/^v//g; s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$_name/cmd/pixterm"
    go build -o ../../pixterm
}

package() {
    cd "$srcdir/$_name"
    install -Dm755 pixterm "$pkgdir/usr/bin/pixterm"
}

