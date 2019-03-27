# Maintainer: modula t. <defaultxr at gmail dot com>
# Contributor: speps <speps at aur dot archlinux dot org>

pkgname=newtonator
pkgver=0.6.0
pkgrel=2
pkgdesc="An LV2 soft synth based on velocity and acceleration"
arch=(i686 x86_64)
url="http://newtonator.sourceforge.net/"
license=('GPL3')
depends=('lv2' 'gtkmm' 'stk')
groups=('lv2-plugins')
makedepends=('cmake' 'lv2-c++-tools')
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('7f2db9a8928c5e06af1312f50c806646')

prepare() {
    cd $pkgname-$pkgver
    [ -d b ] || mkdir b
}

build() {
    cd $pkgname-$pkgver/b
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr
    make

    # comment out apparently problematic lines in newt_lv2_instr.ttl
    sed -i 's/foaf/#foaf/g' ../src/newt_lv2_instr/bundle/newt_lv2_instr.ttl
}

package() {
    cd $pkgname-$pkgver/b
    make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
