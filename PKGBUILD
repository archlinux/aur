# Maintainer: Nocifer <apmichalopoulos at gmail dot com>
# Contributor: eduardosm

pkgname=subtitleedit-legacy
pkgver=4.0.16
pkgrel=1
pkgdesc='An advanced subtitle editor and converter (legacy Mono version)'
arch=('any')
url='https://www.nikse.dk/SubtitleEdit'
license=('MIT')
depends=('mono' 'ttf-dejavu')
makedepends=('unzip')
optdepends=('ffmpeg: waveform extraction'
            'mpv: video support'
            'libvlc: video support')
conflicts=('subtitleedit')
source=("https://github.com/SubtitleEdit/subtitleedit/releases/download/${pkgver}/SE${pkgver//./}.zip"
        'subtitleedit'
        'subtitleedit.desktop'
        'subtitleedit.png')
b2sums=('f4e28d699cdc1dd23f84a9eaee9e3304d71515124cda71c7ab57ef3982f8a35bff88a076b9cec9e3d484d302cd57cdebdbf111214fcdc38cdcdb9f1cce2d2f8b'
        '3576a8a2c11804ce43150329963122b784da1160e3d7d24e646e2245dac3db886c4c0998d8529e3b18e61c7f0bee55026416bb5cbc993f8e82e07f5c2b1edad3'
        'bbeafd804a2d0ad6de03886771ecafbf3ebaa6ad86f449f2609c413114f898370102d1303135db0e21d04ca2612d40055c8f4de2458fc4a907f709e84940133b'
        'eefd5090791d860aa17f209ccf1d277b6e394af12bce07ecdebae5782b53cd9721c6d53e8034c038c0bdce5ffd09ba0c954aa90aa9cd9fbcffc1558d1010dc26')
noextract=("SE${pkgver//./}.zip")

package() {
    install -dm755 "${pkgdir}"/opt/subtitleedit

    unzip "${srcdir}"/SE${pkgver//./}.zip -d "${pkgdir}"/opt/subtitleedit

    rm -r "${pkgdir}"/opt/subtitleedit/Tesseract302
    rm "${pkgdir}"/opt/subtitleedit/Hunspell{x86,x64}.dll

    touch "${pkgdir}"/opt/subtitleedit/.PACKAGE-MANAGER

    install -Dm755 -t "${pkgdir}"/usr/bin subtitleedit
    install -Dm644 -t "${pkgdir}"/usr/share/applications subtitleedit.desktop
    install -Dm644 -t "${pkgdir}"/usr/share/pixmaps subtitleedit.png
}
