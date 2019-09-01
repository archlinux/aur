# Maintainer: Antonino Maniscalco <antomani103@pm.me>

pkgname=('vbextreme-bar')
pkgdesc="vbextreme's statuts bar"
pkgver=2.0_rc6
pkgrel=1
arch=('x86_64')
url='https://github.com/vbextreme/vbar'
replaces=(vbar-i3wm vbar-dwm)
conflicts=(vbar-i3wm vbar-dwm)
license=('GPLv3')
makedepends=('gperf' 'meson')
source=("https://github.com/vbextreme/vbar/archive/v${pkgver//_/-}.tar.gz")
sha256sums=('SKIP')

prepare() {
    cd "vbar-${pkgver//_/-}"
    meson build
}

build() {
    cd "$srcdir/vbar-${pkgver//_/-}"/build
    meson configure --prefix /usr
    ninja
}

package() {
    cd "$srcdir/vbar-${pkgver//_/-}"/build
    DESTDIR="$pkgdir" ninja install
}

