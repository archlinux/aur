# Maintainer: Nocifer <apmichalopoulos at gmail dot com>
# Contributor: eduardosm

pkgname=subtitleedit
pkgver=4.0.15
pkgrel=2
pkgdesc='An advanced subtitle editor and converter'
arch=('any')
url='https://www.nikse.dk/SubtitleEdit'
license=('GPL-3.0-only')
depends=('mono' 'ttf-dejavu')
makedepends=('unzip')
optdepends=('ffmpeg: waveform extraction'
            'mpv: video support')
source=("https://github.com/SubtitleEdit/subtitleedit/releases/download/$pkgver/SE${pkgver//./}.zip"
        'subtitleedit'
        'subtitleedit.desktop'
        'subtitleedit.png')
b2sums=('3e65f6d092aea1dfc45644089d55abd95db0223b68f2223e6750a9cf888962189bad7c6471e250ea0d74e0acbf7f2cb0e144c243ac140ce9acb3c0495984d41f'
        '3576a8a2c11804ce43150329963122b784da1160e3d7d24e646e2245dac3db886c4c0998d8529e3b18e61c7f0bee55026416bb5cbc993f8e82e07f5c2b1edad3'
        'bbeafd804a2d0ad6de03886771ecafbf3ebaa6ad86f449f2609c413114f898370102d1303135db0e21d04ca2612d40055c8f4de2458fc4a907f709e84940133b'
        'a3a50848054537f84137a05c721491dd6f7b19a4f115758e127c124d14b3a1d8623f5eee7424fbc9f94ca5a948dd1e2728e01e3dd1ab8d413e0f71dfa46b8f6c')
noextract=("SE${pkgver//./}.zip")

package() {
    install -dm755 "${pkgdir}"/opt/subtitleedit

    unzip "${srcdir}"/SE${pkgver//./}.zip -d "${pkgdir}"/opt/subtitleedit

    rm -r "${pkgdir}"/opt/subtitleedit/Tesseract302
    rm "${pkgdir}"/opt/subtitleedit/Hunspell{x86,x64}.dll

    touch "${pkgdir}"/opt/subtitleedit/.PACKAGE-MANAGER

    install -Dm755 "${srcdir}"/subtitleedit "${pkgdir}"/usr/bin/subtitleedit
    install -Dm644 "${srcdir}"/subtitleedit.desktop "${pkgdir}"/usr/share/applications/subtitleedit.desktop
    install -Dm644 "${srcdir}"/subtitleedit.png "${pkgdir}"/usr/share/pixmaps/subtitleedit.png
}
