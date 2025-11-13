# Maintainer: Pablo "3l H4ck3r C0mf0r7/PABLEXWorld" Omar Dantur <pablexworld13@gmail.com>
# Contributor: Andrew Rabert <ar@nullsum.net>
pkgname=nuked-sc55-jcmoyer-git
pkgver=r465.6291463
pkgrel=1
pkgdesc='Roland SC-55 series emulator'
arch=('i686' 'x86_64')
license=('MAME')
url='https://github.com/jcmoyer/Nuked-SC55'
depends=('rtmidi' 'sdl2')
makedepends=('cmake')
source=("git+https://github.com/jcmoyer/Nuked-SC55.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/Nuked-SC55"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/Nuked-SC55"
    mkdir -p build
    cd build
    cmake \
        -DCMAKE_BUILD_TYPE='release' \
        -DCMAKE_INSTALL_PREFIX='/usr/' \
        -DCMAKE_SKIP_RPATH=1 \
        -DUSE_SYSTEM_RTMIDI=1 \
        ..
    cmake build .
}

package() {
    cd "${srcdir}/Nuked-SC55/build"
    DESTDIR="${pkgdir}" make install
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" ../LICENSE
}
