# Maintainer: Joost Molenaar <jjm@j0057.nl>

pkgname=fluent-bit

pkgmaj=0.14
pkgver=0.14.2
pkgrel=1
epoch=

pkgdesc='Collect data/logs from different sources, unify and send them to multiple destinations.'
arch=(x86_64)
url='https://fluentbit.io/'
license=('Apache')
groups=()

depends=()
makedepends=(cmake)
checkdepends=()
optdepends=()

provides=()
conflicts=()
replaces=()

backup=('etc/fluent-bit/fluent-bit.conf'
        'etc/fluent-bit/parsers.conf')
options=()
install=
changelog=
source=("https://fluentbit.io/releases/$pkgmaj/$pkgname-$pkgver.tar.gz")
noextract=()
validpgpkeys=()

build() {
    cd $pkgname-$pkgver/build
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_SYSCONFDIR=/etc ..
    make -j8
}

package() {
    cd $pkgname-$pkgver/build
    make DESTDIR="$pkgdir/" install
    mv $pkgdir/lib/* $pkgdir/usr/lib
    rmdir $pkgdir/lib
}

md5sums=('e3a882f572cc797b64bc176cb83973f0')
