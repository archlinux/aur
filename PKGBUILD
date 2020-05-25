# Contributor: Brett Cornwall <ainola@archlinux.org>
# Contributor: Ner0
# Contributor: quantax
# Contributor: xyproto

pkgname=ags
pkgver=3.5.0.24
pkgrel=1
pkgdesc='A development tool that is primarily used to create graphical adventure games'
arch=('x86_64')
url='https://github.com/adventuregamestudio/ags'
license=('Artistic2.0')
# ags depends on Allegro 4 and do not have plans to upgrade - they intend to replace Allegro entirely with SDL.
# https://github.com/adventuregamestudio/ags/issues/403
# https://github.com/adventuregamestudio/ags/issues/762
# https://github.com/adventuregamestudio/ags/issues/1051#issuecomment-602217650
depends=('dumb-a4' 'libtheora' 'freetype2')
makedepends=('cmake' 'wxgtk')
source=("$pkgname-$pkgver.tar.gz::https://github.com/adventuregamestudio/ags/archive/v.$pkgver.tar.gz"
        'https://github.com/adventuregamestudio/ags/commit/44d954493bb5f3e95a11a4eddbb62bd6110b1b63.patch')
sha256sums=('289d6d832cb35f18d67a03bbdb30f62c6f6ad6984a99e0e34356c6717df40b9f'
            '6b7092e5794ae532f79c5c6ad5f5761c217b3ec874da43537152fb8e60b20019')

build() {
    cd "ags-v.$pkgver"
    cmake -DCMAKE_INSTALL_PREFIX=/usr \
          -DCMAKE_BUILD_TYPE='Release' \
          -B build
    make -C build
}

package() {
    install -Dm755 "ags-v.$pkgver/build/ags" -t "$pkgdir/usr/bin/"
}
