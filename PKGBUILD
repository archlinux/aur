# Maintainer: Nocifer <apmichalopoulos at gmail dot com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname='vapoursynth-editor'
pkgver='r19_mod_6.4'
pkgrel='1'
pkgdesc='Editor for VapourSynth scripts'
arch=('x86_64')
url='https://github.com/YomikoR/VapourSynth-Editor'
license=('CC-BY-2.5 AND CC-BY-3.0 AND CC-BY-4.0 AND MIT')
depends=('qt6-5compat' 'qt6-websockets' 'vapoursynth>=R58')
options=('!lto')
source=("https://github.com/YomikoR/VapourSynth-Editor/archive/refs/tags/${pkgver//_/-}.tar.gz"
        'vsedit.desktop')
sha256sums=('0936417f8b255ecbd44f018bf57ede3f12b8d4bcd3a3030d58c1559866a067d4'
            'b6d24441cf5746ea4dc08ecf379c67695bac663deb394db4334ba6aba9474c0f')

build() {
    cd VapourSynth-Editor-${pkgver//_/-}/pro

    qmake6 -norecursive pro.pro CONFIG+=release
    make
}

package() {
    cd VapourSynth-Editor-${pkgver//_/-}

    install -Dm755 build/release-64bit-gcc/vsedit -t "${pkgdir}"/usr/bin/
    install -Dm755 build/release-64bit-gcc/vsedit-job-server -t "${pkgdir}"/usr/bin/
    install -Dm755 build/release-64bit-gcc/vsedit-job-server-watcher -t "${pkgdir}"/usr/bin/
    install -Dm755 build/release-64bit-gcc/vsedit-previewer -t "${pkgdir}"/usr/bin/

    install -Dm644 build/release-64bit-gcc/LICENSE -t "${pkgdir}"/usr/share/licenses/"${pkgname}"/

    install -Dm644 build/release-64bit-gcc/vsedit.svg -t "${pkgdir}"/usr/share/pixmaps/
    install -Dm644 ../vsedit.desktop -t "${pkgdir}"/usr/share/applications/
}
