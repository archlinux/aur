# Maintainer: alba4k <blaskoazzolaaaron@gmail.com>
pkgname=albafetch-git
pkgver=4.2.r5.g66cfe46b
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

build() {
    cd albafetch
    make CC=gcc build/albafetch
}

package() {
    cd albafetch
    make PKGNAME=$pkgname INSTALLPATH="$pkgdir/usr/bin" CONFIGPATH="$pkgdir/etc/xdg" install
    
	install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
	install -Dm644 README.md $pkgdir/usr/share/doc/$pkgname/README.md
	install -Dm644 MANUAL.md $pkgdir/usr/share/doc/$pkgname/MANUAL.md
}

