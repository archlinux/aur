# Maintainer: Lone_Wolf <lone_wolf@klaas-de-kat.nl>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Hans Janssen <janserv@gmail.com>
# Contributor: my64 <packages@obordes.com>
# Contributor: Colin Pitrat <colin.pitrat@gmail.com>

pkgname=openscenegraph34
pkgver=3.4.1
pkgrel=1
pkgdesc='Open Source, high performance real-time graphics toolkit'
url='http://www.openscenegraph.org'
arch=('x86_64')
license=('custom:OSGPL')
depends=('giflib' 'jasper' 'librsvg' 'xine-lib' 'curl' 'pth')
makedepends=('cmake' 'libvncserver' 'qt5-base' 'ffmpeg' 'mesa' 'ninja' 'qt5-webkit')
optdepends=('libvncserver'  'qt5-base' 'ffmpeg' 'qt5-webkit' 'gst-plugins-base-libs' 'openexr')
conflicts=('openscenegraph')
source=(https://github.com/openscenegraph/OpenSceneGraph/archive/OpenSceneGraph-${pkgver}.tar.gz)
sha256sums=('930eb46f05781a76883ec16c5f49cfb29a059421db131005d75bec4d78401fd5')
sha512sums=('4a65625e208d24256b5564bbe9d6f557758b51fae0acf85d1f71968a237fec299088536830fc862d25e02039de9ea13176b298a68aaa644eac958acbe1f4e143')

# NINJAFLAGS is an env var used to pass commandline options to ninja
# NOTE: It's your responbility to validate the value of $NINJAFLAGS. If unsure, don't set it.

prepare() {
   if [  -d _build ]; then
        rm -rf _build
    fi
    mkdir _build
}

build() {
    cd _build
    cmake "${srcdir}\OpenSceneGraph-OpenSceneGraph-${pkgver}" \
        -G Ninja \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DLIB_POSTFIX=${libdir/lib} \

    ninja $NINJAFLAGS
}

package() {
    cd _build
    DESTDIR="$pkgdir" ninja $NINJAFLAGS install
    install -Dm 644 "${srcdir}/OpenSceneGraph-OpenSceneGraph-${pkgver}"/LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
