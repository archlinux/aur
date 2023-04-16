# Maintainer: Sean Teo <sawntoe@gmail.com>

pkgname='redeclipse-dev'
pkgver=v2.0.0.r1746.ga70a6a3
pkgrel=1
pkgdesc='Developmental version of Redeclipse, a free and open source movement based shooter'
arch=('x86_64')
url='https://github.com/redeclipse/base.git'
license=("ZLIB" "CCPL:by-sa" "CCPL:by" "custom")
makedepends=(ed sdl2_mixer sdl2_image enet git)
depends=(sdl2_image sdl2_mixer enet hicolor-icon-theme)
#provides=(redeclipse)
conflicts=(redeclipse)
source=('redeclipse-dev::git+https://github.com/redeclipse/base.git')
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$pkgname"
    git submodule init
    git submodule update
}

build() {
    cd "$pkgname"
    make -C src/ client server
}

package() {
    cd "$pkgname"
    make -C src/ DESTDIR="$pkgdir" prefix=/usr system-install
    install -Dm 0644 "doc/license.txt" "$pkgdir/usr/share/licenses/$pkgname/license.txt"
    install -Dm 0644 "doc/all-licenses.txt" "$pkgdir/usr/share/licenses/$pkgname/all-licenses.txt"
}
