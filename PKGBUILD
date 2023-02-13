# Maintainer: Nocifer <apmichalopoulos at gmail dot com>
# Contributor Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname='vapoursynth-editor'
pkgver=r19_mod_6
pkgrel=1
pkgdesc='Cross-platform editor for VapourSynth scripts'
arch=('x86_64')
url='https://github.com/YomikoR/VapourSynth-Editor'
license=('CCPL' 'LGPL' 'MIT')
depends=('qt6-5compat' 'qt6-base' 'qt6-websockets' 'vapoursynth>=R58')
source=("https://github.com/YomikoR/VapourSynth-Editor/archive/refs/tags/${pkgver//_/-}.tar.gz"
        'vsedit.desktop')
sha256sums=('e13497cccd730b75b44f1f15277e1729a68bb6b01dec97dc670666e05706844c'
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
    install -Dm644 build/release-64bit-gcc/LICENSE -t "${pkgdir}"/usr/share/licenses/vapoursynth-editor/
    install -Dm644 ../vsedit.desktop -t "${pkgdir}"/usr/share/applications/
}
