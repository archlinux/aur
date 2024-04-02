# Maintainer: alba4k <blaskoazzolaaaron@gmail.com>
pkgname=albafetch-git
pkgver=4.1.r89.g5eb870c7
pkgrel=1
pkgdesc="Neofetch, but written in C; both faster and worse than the original (latest commit)"
arch=(x86_64 aarch64)
url="https://github.com/alba4k/albafetch"
license=('MIT')
makedepends=(git make gcc)
depends=(pciutils)
conflicts=(albafetch albafetch-bin)
provides=(albafetch)
source=("git+$url")
md5sums=('SKIP')

pkgver() {
    cd albafetch
    git describe --long --tags --abbrev=8 --exclude='*[a-zA-Z][a-zA-Z]*' \
      | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

package() {
    cd albafetch
    make CC=gcc INSTALLPATH="$pkgdir/usr/bin" CONFIGPATH="$pkgdir/etc/xdg" DATAPATH="$pkgdir/usr/share" install
}

