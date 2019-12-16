# Maintainer: Jianqiu Zhang <void001@archlinuxcn.org>


pkgname=oomd-git
pkgver=20190207
pkgrel=1
pkgdesc='A userspace out-of-memory killer'
arch=('x86_64')
url="https://github.com/facebookincubator/oomd"
license=('GPL2')
depends=('jsoncpp')
makedepends=('meson' 'ninja' 'git' 'jsoncpp')
md5sums=('SKIP')

source=(
    "oomd::git+https://github.com/facebookincubator/oomd.git"
)


prepare() {
    echo "Prepare do nothing"
#    cp fix-meson-no-install.patch $srcdir/oomd/
#    cd $srcdir/oomd/
#    patch -p1 < fix-meson-no-install.patch
}

build() {
    cd $srcdir/oomd
    meson --prefix "$pkgdir/usr" build && ninja -C build
}

package() {
    cd $srcdir/oomd
    ninja -C build install
    install -Dm644 $srcdir/oomd/src/oomd/etc/desktop.json $pkgdir/etc/desktop.json.example
}
