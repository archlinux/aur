# Maintainer: Ainola <ainola@archlinux.org>
# Contributor: Ner0
# Contributor: quantax
# Contributor: xyproto

pkgname=ags
pkgver=3.4.4.2
pkgrel=1
pkgdesc='A development tool that is primarily used to create graphical adventure games'
arch=('x86_64')
url='https://github.com/adventuregamestudio/ags'
license=('Artistic2.0')
depends=('dumb-a4' 'libtheora' 'freetype2')
makedepends=('wxgtk')
source=("$pkgname-$pkgver.tar.gz::https://github.com/adventuregamestudio/ags/archive/v.$pkgver.tar.gz"
        'https://github.com/adventuregamestudio/ags/commit/44d954493bb5f3e95a11a4eddbb62bd6110b1b63.patch')
sha256sums=('dfbbabc8d54ec5182194a4565e3acb5c6daef5e90e6bafec65340183a9402743'
            '6b7092e5794ae532f79c5c6ad5f5761c217b3ec874da43537152fb8e60b20019')

prepare() {
    mv "ags-v.$pkgver" "$pkgname-$pkgver"

    # Copious use of auto_ptr spams the compilation output. Until they're
    # replaced, just suppress the message.
    sed -i 's/-Wfatal-errors/-Wfatal-errors\ -Wno-deprecated-declarations/' \
        "$pkgname-$pkgver/Engine/Makefile-defs.linux"
}

build() {
    cd "$pkgname-$pkgver"
    make -C Engine
}

package() {
    install -Dm755 "$pkgname-$pkgver/Engine/ags" -t "$pkgdir/usr/bin/"
}
