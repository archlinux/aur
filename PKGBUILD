# Maintainer: NidoBr <nidobrcontato@gmail.com>

pkgname=tclvfs
pkgver=1.5.0
pkgrel=1
pkgdesc="Virtual filesystem extension for Tcl"
arch=('x86_64')
url="https://core.tcl-lang.org/tclvfs/"
license=('BSD-3-Clause')

depends=('tcl')

source=("https://core.tcl-lang.org/tclvfs/tarball/tclvfs-20260902141922-ba2505e7d7.tar.gz")
sha256sums=('b0dbaafc328d83d3b0bb2aa5ca817daaf2f3ca499603926ef7817dd78517406b')

_dir="tclvfs-20260902141922-ba2505e7d7"

build() {
    cd "$srcdir/$_dir"
    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir/$_dir"

    local tclver=$(tclsh <<< 'puts $tcl_version')
    local tcldir="$pkgdir/usr/lib/tcl${tclver}/vfs$pkgver"

    install -d "$tcldir"
    install -m755 libvfs${pkgver}.so "$tcldir/"
    install -m644 library/*.tcl "$tcldir/"
    install -m644 pkgIndex.tcl "$tcldir/"
}
