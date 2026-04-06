# Maintainer: Nocifer <apmichalopoulos at gmail dot com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=vapoursynth-editor
pkgver=r19_mod_6.9
_pkgver=R19_mod_6.9
pkgrel=1
pkgdesc='Editor for VapourSynth scripts'
arch=('x86_64')
url='https://github.com/YomikoR/VapourSynth-Editor'
license=('MIT')
depends=('qt6-5compat' 'qt6-websockets' 'vapoursynth')
source=("https://github.com/YomikoR/VapourSynth-Editor/archive/refs/tags/${_pkgver//_/-}.tar.gz"
        'vsedit.desktop')
options=('!lto')
b2sums=('a446c8a79106cff427ee829204f9588eaf1488049f791bbedd2aa904bfd22a487e7570f3763fedc2423fb6b660864891a6bc42f47be0434b831032ac88f4ee51'
        '17ec3156102b633a14d963f1a7e600afedc5b2470555ebcfee1f47ca2de5ebd6fc8bd28896ff0f5b3dd0187d24dd869385560e825cafad6ecd866eb9b07a4be4')

build() {
    cd VapourSynth-Editor-${_pkgver//_/-}/pro

    export VS_INCLUDE_PATH='/usr/include/vapoursynth'
    qmake6 -norecursive pro.pro CONFIG+=release
    make
}

package() {
    cd VapourSynth-Editor-${_pkgver//_/-}

    install -Dm755 build/release-64bit-gcc/vsedit -t "${pkgdir}"/usr/bin/
    install -Dm755 build/release-64bit-gcc/vsedit-job-server -t "${pkgdir}"/usr/bin/
    install -Dm755 build/release-64bit-gcc/vsedit-job-server-watcher -t "${pkgdir}"/usr/bin/
    install -Dm755 build/release-64bit-gcc/vsedit-previewer -t "${pkgdir}"/usr/bin/

    install -Dm644 build/release-64bit-gcc/LICENSE -t "${pkgdir}"/usr/share/licenses/"${pkgname}"/

    install -Dm644 build/release-64bit-gcc/vsedit.svg -t "${pkgdir}"/usr/share/icons/hicolor/scalable/apps
    install -Dm644 "${srcdir}"/vsedit.desktop -t "${pkgdir}"/usr/share/applications/
}
