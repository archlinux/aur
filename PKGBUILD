pkgname=ksysguard-daemon
pkgver=5.22.0
pkgrel=1
pkgdesc="KSysGuardD without GUI stuff"
arch=(any)
depends=(
    libsensors.so
    glibc
)
conflicts=(
    ksysguard
)
provides=(
    ksysguard
)
makedepends=(
    wget
)

build(){
    mkdir "$srcdir/pkg"
    cd "$srcdir/pkg"
    wget "$(pacman -Sp ksysguard=$pkgver-$pkgrel | tail -n 1)"
    pkgfilename="$(ls)"
    mkdir unpacked
    tar -xf "$pkgfilename" -C ./unpacked
}

package(){
    mkdir -p "$pkgdir/usr/bin"
    cp -p "$srcdir/pkg/unpacked/usr/bin/ksysguardd" "$pkgdir/usr/bin/ksysguardd"
}
