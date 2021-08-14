# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Brett Cornwall <ainola@archlinux.org>
# Contributor: Ner0
# Contributor: quantax
# Contributor: xyproto

pkgname=ags
pkgver=3.5.1.10
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
sha256sums=('2a6df3046c3f9dd403326cc57c3574b15dfa1e11eac85fb398dafcd994e0d9ef')

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
