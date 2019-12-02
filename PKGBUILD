# Maintainer: Antonino Maniscalco <antomani103@pm.me>

pkgname=('vbextreme-bar-git')
pkgdesc="vbextreme's statuts bar"
pkgver=2.0.rc6.r1.gf30dba2
pkgrel=1
arch=('x86_64')
url='https://github.com/vbextreme/vbar'
replaces=(vbextreme-bar vbar-i3wm vbar-dwm)
conflicts=(vbextreme-bar vbar-i3wm vbar-dwm)
license=('GPLv3')
makedepends=('tcc' 'gperf' 'meson')
source=('git+https://github.com/vbextreme/vbar.git')
sha256sums=('SKIP')

pkgver() {
  cd "vbar"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd vbar
    meson build
}

build() {
    cd "$srcdir"/vbar/build
    meson configure --prefix /usr
    ninja
}

package() {
    cd "$srcdir"/vbar/build
    DESTDIR="$pkgdir" ninja install
}

