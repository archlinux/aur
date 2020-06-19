# Maintainer: Uncle Hunto <unclehunto äτ ÝãΗ00 Ð0τ ÇÖΜ>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# (added from qt4pas package)
# Contributor: BlackIkeEagle <ike.devolder@gmail.com>
# Contributor: Fabien Wang <fabien.wang@gmail.com>

_pkgname=qt4pas
pkgname=lib32-$_pkgname
pkgver=2.5
pkgrel=7
pkgdesc="Free Pascal Qt4 binding library"
arch=(x86_64)
url=http://users.telenet.be/Jan.Van.hijfte/qtforfpc/fpcqt4.html
license=(LGPL3)
depends=(lib32-qt4)
makedepends=(gcc-multilib lib32-qtwebkit)
_srcname=$_pkgname-V${pkgver}_Qt4.5.3
source=(${url%/*}/V$pkgver/$_srcname.tar.gz)
sha256sums=('825423db80da4df5c21816c0392b3394cddfe2f3293dfd08ace84941726affea')
sha512sums=('ceadfa35fde3649e370b9f61693692a35e4e512486dc553037d79b587cfdd343314cdf3646a2e90c3c9fa5a6f8818b2716e7cb81a39cb6f5ae27a527bc3dd962')

build() {
    cd "$srcdir"/$_srcname/
    sed -ri "s:(target\.path = ).*:\1$pkgdir/usr/lib32:g" Qt4Pas.pro

    qmake-qt4 -query
    qmake-qt4 -r -spec linux-g++-32
    make
}

package() {
    make -C "$srcdir"/$_srcname/ install

    cd "$pkgdir"/usr/lib32/
    for intflink in libqt4intf.so{,.5,.5.2{,.1,.5}}; do
        ln -sfv libQt4Pas.so.5.2.5 $intflink
    done
}
