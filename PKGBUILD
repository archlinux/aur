# Maintainer: m8D2 <mimi55 (at) proton mail (dot) com>

pkgname=f3-qt
pkgver=2.1.0
pkgrel=1
pkgdesc="A simple GUI for F3 - Fight Flash Fraud."
arch=('i686' 'x86_64')
url="https://github.com/zwpwjwtz/f3-qt"
license=('GPL3')
makedepends=('qt5-base')
depends=('f3' 'qt5-base')
provides=('f3-qt')
conflicts=('f3-qt-git')
source=(
    $url/archive/v$pkgver.tar.gz
    2.10-157d962.patch
    https://raw.githubusercontent.com/zwpwjwtz/$pkgname/157d9621846bbe81dbb504955327a8c9bf7359d7/$pkgname.desktop
)
sha256sums=(
    '09e2469c9ac601e74325b8bb79143f292c4235b1ea49aee2b6570a3df9fca92e'
    '621c3c054d2c5a45ba54c6c4093cac6df7b916a16e9a8ea47958fdef58594953'
    '3d537f2319f63e1d68286ea1c27a9178645c1e5232841db2a9841f5e17da4239'
)

prepare() {
    cd $srcdir/$pkgname-$pkgver 
    patch -p1 -i $srcdir/2.10-157d962.patch
}

build() {
    cd $srcdir/$pkgname-$pkgver
    qmake
    make
}

package() {
    cd $srcdir/$pkgname-$pkgver
    install -Dm755 $srcdir/$pkgname-$pkgver/$pkgname $pkgdir/usr/bin/$pkgname
    install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
