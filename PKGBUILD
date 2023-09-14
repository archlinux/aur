# Maintainer: vale-max <anziolin@gmail.com>

pkgname=dab-scanner
pkgver=0.8
pkgrel=4
pkgdesc='A simple command line program based on the DAB library'
arch=(armv6h armv7h aarch64)
makedepends=(cmake rtl-sdr)
depends=(gcc-libs rtl-sdr)
url=https://github.com/JvanKatwijk/dab-cmdline
license=('GNU')
source=(https://github.com/vale-max/dab-cmdline/archive/refs/heads/master.zip)
sha256sums=('b9e2b9fde78ec76cf834c4565e4b63a6a05529805606db3453e336277170ddbe')

build() {
    subdir=$srcdir/dab-cmdline-master
    cd $subdir/dab-scanner
    cmake -DRTLSDR=ON
    make
    cd $subdir/example-3
    cmake -DRTLSDR=ON
    make
}

package() {
    gccver=$( pacman -Q gcc | cut -c 5-10 )
    depends=( 'gcc>='$gccver 'gcc-libs>='$gccver rtl-sdr mediamtx )
    subdir=$srcdir/dab-cmdline-master
    cd $subdir/dab-scanner
    install -Dm 755 dab-scanner-rtlsdr -t $pkgdir/usr/bin
    cd $subdir/example-3
    install -Dm 755 dab-rtlsdr-3 -t $pkgdir/usr/bin
}
