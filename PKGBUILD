# Maintainer: Josh Wright <wright.jjw@gmail.com>
pkgname=tsal-git
pkgver=r166.93dccae
pkgrel=1
pkgdesc="Thread Safe Audio Library"
arch=(x86_64)
url="https://github.com/Calvin-CS/TSAL"
license=('GPL')
depends=(portaudio)
makedepends=(git)       # packages in base-devel (make and gcc) are assumed to be installed
                        # (https://wiki.archlinux.org/index.php/PKGBUILD#makedepends)
optdepends=()
provides=(tsal)
conflicts=(tsal)
source=("git+$url")
md5sums=("SKIP")

pkgver() {
    cd "TSAL"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "TSAL"
    autoreconf -vi
    ./configure --prefix=/usr
    make
}

package() {
	cd "TSAL"
	make DESTDIR="$pkgdir/" install
}
