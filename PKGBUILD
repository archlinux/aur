# Maintainer: Nocifer <apmichalopoulos at gmail dot com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname='vapoursynth-editor'
pkgver=r19_mod_6.3
pkgrel=1
pkgdesc='Cross-platform editor for VapourSynth scripts'
arch=('x86_64')
url='https://github.com/YomikoR/VapourSynth-Editor'
license=('CCPL' 'LGPL' 'MIT')
depends=('qt6-5compat' 'qt6-base' 'qt6-websockets' 'vapoursynth>=R58')
source=("https://github.com/YomikoR/VapourSynth-Editor/archive/refs/tags/${pkgver//_/-}.tar.gz"
        'vsedit.desktop')
sha256sums=('fcbd60ced6304ed4088e8bc7ed328d3d54a2c881a3324d0701cfd09a81d9e7cd'
            'b6d24441cf5746ea4dc08ecf379c67695bac663deb394db4334ba6aba9474c0f')

build() {
    cd VapourSynth-Editor-${pkgver//_/-}/pro

    qmake6
    make
}

package() {
    cd VapourSynth-Editor-${pkgver//_/-}

    install -Dm755 build/release-64bit-gcc/vsedit -t "${pkgdir}"/usr/bin/
    install -Dm644 build/release-64bit-gcc/vsedit.svg -t "${pkgdir}"/usr/share/pixmaps/
    install -Dm644 build/release-64bit-gcc/LICENSE -t "${pkgdir}"/usr/share/licenses/"${pkgname}"/
    install -Dm644 ../vsedit.desktop -t "${pkgdir}"/usr/share/applications/
}
