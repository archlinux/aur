# Maintainer: RealStickman <mrc+aur@frm01.net>

pkgname=ntttcp-for-linux-git
pkgver=1.4.0.r49.g68a4cf5
pkgrel=1
pkgdesc="A multiple-threaded Linux network throughput benchmark tool."
arch=('x86_64')
url="https://github.com/Microsoft/ntttcp-for-linux"
license=('MIT')
makedepends=('git')
provides=("${pkgname%-for-linux-git}")
conflicts=("${pkgname%-for-linux-git}")
source=("${pkgname%-git}::git+$url.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    # change into source
    cd "$srcdir/${pkgname%-git}/src"
    # compile program
    make
}

package() {
    # create our target filestructure
    mkdir -p "$pkgdir/usr/bin"
    # change into source
    cd "$srcdir/${pkgname%-git}/src"
    # install program
    make PREFIX="$pkgdir/usr/bin" install
}
