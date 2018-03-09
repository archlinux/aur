# Contributor: Andrew Rabert <draje@nullsum.net>

pkgname=scrcpy
pkgver=1.0
pkgrel=2
pkgdesc='Display and control your Android device'
arch=('i686' 'x86_64')
url='https://github.com/Genymobile/scrcpy'
license=('Apache')
depends=('ffmpeg' 'jre8-openjdk' 'sdl2')
makedepends=('gcc' 'meson' 'jdk8-openjdk')
source=("scrcpy-${pkgver}.tar.gz::https://github.com/Genymobile/scrcpy/archive/v${pkgver}.tar.gz")
sha256sums=('fda84b2fc6a60bf808f7b87f7c9a985a446bad69d4de8e63e9ce699871f8026f')


build() {
    cd scrcpy-${pkgver}
    meson build --buildtype release --strip -Db_lto=true \
        -Doverride_server_path=/usr/share/scrcpy/scrcpy-server.jar
    cd build
    ninja
}

package() {
    cd scrcpy-${pkgver}/build
    mkdir -p "${pkgdir}"/usr/bin "${pkgdir}"/usr/share/scrcpy
    install -m 755 app/scrcpy "${pkgdir}"/usr/bin/
    install -m 755 server/scrcpy-server.jar "${pkgdir}"/usr/share/scrcpy/
}
