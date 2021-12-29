# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Brett Cornwall <ainola@archlinux.org>
# Contributor: Ner0
# Contributor: quantax
# Contributor: xyproto

pkgname=ags
pkgver=3.5.1.13
pkgrel=1
pkgdesc='Engine to run adventure/quest games'
arch=('x86_64')
url='https://github.com/adventuregamestudio/ags'
license=('Artistic2.0')
# ags depends on Allegro 4 and do not have plans to upgrade - they intend to replace Allegro entirely with SDL.
# https://github.com/adventuregamestudio/ags/issues/403
# https://github.com/adventuregamestudio/ags/issues/762
# https://github.com/adventuregamestudio/ags/issues/1051#issuecomment-602217650
depends=('dumb-a4' 'libtheora' 'freetype2' 'sdl2' 'alsa-lib' 'jack' 'libx11' 'libxext' 'libxcursor' 'libxpm' 'libxxf86vm')
makedepends=('cmake' 'wxgtk2')
source=("$pkgname-$pkgver.tar.gz::https://github.com/adventuregamestudio/ags/archive/v.$pkgver.tar.gz")
sha256sums=('be01e9410205d47c904e06df309abfa8f37a8a9775b45fba90d19168b7aed9a9')

build() {
    cmake -S "ags-v.$pkgver" -B 'build' \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DCMAKE_BUILD_TYPE='Release' \
          -DCMAKE_C_FLAGS_RELEASE='-DNDEBUG -w' \
          -DCMAKE_CXX_FLAGS_RELEASE='-DNDEBUG -w'
    cmake --build 'build'
}

package() {
    #cd "ags-v.$pkgver"
    #DESTDIR="${pkgdir}" cmake --install "build"
    install -Dm755 'build/ags' -t "$pkgdir/usr/bin/"
}
