# Maintainer: Igor Deyashkin <igor_deyawka@mail.ru>
pkgname="medivia"
pkgver="2.5.1"
pkgrel=0
pkgdesc="Client for medivia.online mmorpg server."
arch=('i686' 'x86_64')
url="https://medivia.online/download"
# I am not sure what license is used
license=('unknown')
depends_x86_64=('lib32-libglvnd')
depends_i686=('libglvnd')
makedepends=('chrpath')
source=("$pkgname-$pkgver.tar.gz::https://medivia.online/uploads/downloads/medivia-$pkgver-linux-32bits.tar.gz"
        "$pkgname.desktop")

# The archive does not containing root folder in it. I unextract it later on build stage into separate subfolder.
noextract=("$pkgname-$pkgver.tar.gz")

# autofill using updpkgsums
md5sums=('8fdf6590b0c430dccf3f0bf7f32e34bc'
         '2791be26444cdf1b14d8a49736a6bbb9')

prepare() {
    mkdir -p "$pkgname-$pkgver"
    bsdtar -xzf "$pkgname-$pkgver.tar.gz" -C "$pkgname-$pkgver"

    chrpath -d "$pkgname-$pkgver/medivia"
}

package() {
    mkdir -p "$pkgdir/opt"
    mkdir -p "$pkgdir/usr/bin"

    cp -Rv "$srcdir/$pkgname-$pkgver" "$pkgdir/opt/$pkgname"

    install -Dm644 "$srcdir/$pkgname.desktop"    "$pkgdir/usr/share/applications/$pkgname.desktop"

    # I am not sure this is a good way
    ln -s "/opt/$pkgname/medivia" "$pkgdir/usr/bin/$pkgname"
}
