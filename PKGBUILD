# Contributor: Brett Cornwall <ainola@archlinux.org>
# Contributor: Ner0
# Contributor: quantax
# Contributor: xyproto

pkgname=ags
pkgver=3.5.0.27
pkgrel=1
pkgdesc='Engine to run adventure/quest games'
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
        'https://github.com/adventuregamestudio/ags/commit/fa1b9c7a442ac6966357d510fb7e6b78a214410d.patch')
sha256sums=('f8940e390510ebddc872ae032bc65351581a67bf9bb64a0c5d8e996615baf819'
            '5b6cf508340ae23aac6c4ed0805f64330333b9b6ba466e60f8d625aedaa07208')

prepare () {
    cd "ags-v.$pkgver"
    # https://github.com/adventuregamestudio/ags/issues/1080
    patch -p1 < ../fa1b9c7a442ac6966357d510fb7e6b78a214410d.patch
}

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
