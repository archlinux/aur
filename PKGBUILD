# Maintainer: Marc Vidal <mvidaldp@gmail.com>

pkgname="labrecorder"
pkgver=v1.13.1
pkgrel=1
pkgdesc="Default LSL (LabStreamingLayer) recording program (stable release). It allows to record all streams on the lab network (or a subset) into a single file, with time synchronization between streams."
arch=('x86_64')
url="https://github.com/sccn/liblsl/"
license=('MIT')
provides=($pkgname)
conflicts=($pkgname)
depends=('liblsl')
makedepends=('boost' 'cmake' 'qt5-base')
source=("${pkgname}-${pkgver}::git+ssh://git@github.com/labstreaminglayer/App-LabRecorder.git#tag=${pkgver}")
md5sums=('SKIP')


prepare() {
    mkdir -p "$srcdir/$pkgname-${pkgver}/build"
}

build() {
    cd "$srcdir/$pkgname-${pkgver}/build"
    cmake -DLSL_INSTALL_ROOT="/opt/LSL" ..
    make
}

package() {
    mkdir -p $pkgdir/usr/bin
    install -Dm 755 $srcdir/$pkgname-$pkgver/build/LabRecorder $pkgdir/opt/LSL/bin/LabRecorder
    ln -rs -T $pkgdir/opt/LSL/bin/LabRecorder $pkgdir/usr/bin/LabRecorder
    install -Dm 755 $srcdir/$pkgname-$pkgver/build/LabRecorderCLI $pkgdir/opt/LSL/bin/LabRecorderCLI
    ln -rs -T $pkgdir/opt/LSL/bin/LabRecorderCLI $pkgdir/usr/bin/LabRecorderCLI
    install -Dm 755 $srcdir/$pkgname-$pkgver/LabRecorder.cfg $pkgdir/opt/LSL/bin/LabRecorder.cfg
    install -Dm 755 $srcdir/$pkgname-$pkgver/LabRecorder_Legacy.cfg $pkgdir/opt/LSL/bin/LabRecorder_Legacy.cfg
    install -Dm 755 $srcdir/$pkgname-$pkgver/LabRecorder_BIDS.cfg $pkgdir/opt/LSL/bin/LabRecorder_BIDS.cfg
}