# Maintainer: Nocifer <apmichalopoulos at gmail dot com>

pkgname=vapoursynth-previewer
pkgver=R6
pkgrel=1
pkgdesc='Standalone previewer for VapourSynth scripts (vse-previewer)'
arch=('x86_64')
url='https://github.com/YomikoR/VapourSynth-Editor/tree/vse-previewer'
license=('CC-BY-2.5 AND CC-BY-3.0 AND MIT')
depends=('qt6-multimedia' 'vapoursynth')
options=('!lto')
source=("https://github.com/YomikoR/VapourSynth-Editor/archive/refs/tags/VSE-Previewer-${pkgver}.tar.gz")
b2sums=('5b696959bcf2fe6cc07bed32b761e84293a6e2c1b7e14138f184c7edc90f1ee06dd12b4127e820878e9a8b7d65f3e5eddaa03019de74cd051678bdafd1c8d4e8')

build() {
    cd VapourSynth-Editor-VSE-Previewer-${pkgver}/pro

    export VS_INCLUDE_PATH='/usr/include/vapoursynth'
    qmake6 -norecursive vse-previewer.pro CONFIG+=release
    make
}

package() {
    cd VapourSynth-Editor-VSE-Previewer-${pkgver}

    install -Dm755 build/release-gcc/vse-previewer -t "${pkgdir}"/usr/bin/

    install -Dm644 build/release-gcc/LICENSE -t "${pkgdir}"/usr/share/licenses/"${pkgname}"/
}
