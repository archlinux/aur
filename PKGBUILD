# Maintainer: Antonino Maniscalco <antomani103@pm.me>

pkgname=('vbextreme-bar')
pkgdesc="vbextreme's statuts bar"
pkgver=2.0_rc14
pkgrel=1
arch=('x86_64')
url='https://github.com/vbextreme/vbar'
replaces=(vbextreme-bar-git vbar-i3wm vbar-dwm)
conflicts=(vbextreme-bar-git vbar-i3wm vbar-dwm)
license=('GPLv3')
makedepends=('gperf' 'meson')
depends=('tcc')
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

