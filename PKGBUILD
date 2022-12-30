# Maintainer: Nocifer <apmichalopoulos at gmail dot com>
# Contributor Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname='vapoursynth-editor'
pkgver=r19_mod_5.5
pkgrel=1
pkgdesc='Cross-platform editor for VapourSynth scripts'
arch=('x86_64')
url='https://github.com/YomikoR/VapourSynth-Editor'
license=('CCPL' 'MIT')
depends=('qt6-5compat' 'qt6-base' 'qt6-websockets' 'vapoursynth')
source=("https://github.com/YomikoR/VapourSynth-Editor/archive/refs/tags/${pkgver//_/-}.tar.gz"
        'vsedit.desktop')
sha256sums=('7b7b0f413800b94445330a9864999a0c5f0cc837d62db8208229786e7412b776'
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
