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
    meson build
    
    cd "$srcdir"/$pkgbase-dwm
    meson build
}

build() {
    cd "$srcdir"/$pkgbase-i3wm/build
    meson configure -Dwm=i3wm --prefix /usr
    ninja
    
    cd "$srcdir"/$pkgbase-dwm/build
    meson configure -Dwm=dwm --prefix /usr
    ninja
}

package_vbar-i3wm() {
    pkgdesc="Another i3 status bar"
    depends=('i3-wm')
    
    cd "$srcdir"/$pkgbase-i3wm/build
    DESTDIR="$pkgdir" ninja install
}

package_vbar-dwm() {
    pkgdesc="Another dwm status bar"
    depends=('dwm')
    
    cd "$srcdir"/$pkgbase-dwm/build
    DESTDIR="$pkgdir" ninja install
}
