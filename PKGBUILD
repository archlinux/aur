# Maintainer: Ernesto Castellotti <erny.castell@gmail.com>

pkgbase=('vbar')
pkgname=('vbar-i3wm' 'vbar-dwm')
pkgver=master
pkgrel=1
arch=('x86_64')
url='https://github.com/vbextreme/vbar'
license=('GPLv3')
makedepends=('gperf' 'meson')
source=('git+https://github.com/vbextreme/vbar.git')
sha256sums=('SKIP')

prepare() {
    cp -a $pkgbase{,-i3wm}
    cp -a $pkgbase{,-dwm}
    
    cd "$srcdir"/$pkgbase-i3wm
    meson configure -Dwm=i3wm --prefix /usr
    meson build
    
    cd "$srcdir"/$pkgbase-dwm
    meson configure -Dwm=dwm --prefix /usr
    meson build
}

build() {
    cd "$srcdir"/$pkgbase-i3wm
    ninja
    
    cd "$srcdir"/$pkgbase-dwm
    ninja
}

package_vbar-i3wm() {
    pkgdesc="Another i3 status bar"
    depends=('i3-wm')
    DESTDIR="$pkgdir" ninja install
}

package_vbar-dwm() {
    pkgdesc="Another dwm status bar"
    depends=('dwm')
    DESTDIR="$pkgdir" ninja install
}
