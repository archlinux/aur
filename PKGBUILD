#Maintainer: Kevin Alberts <kevin@kevinalberts.nl>

pkgname=franz4-bin
pkgver=4.0.4
pkgrel=2
pkgdesc='Franz is a free messaging app. Legacy version from before the mandatory account change.'
arch=('x86_64')
depends=('alsa-lib' 'bash' 'desktop-file-utils' 'gconf' 'gtk2' 'libnotify' 'libxtst' 'nss' 'libxss')
makedepends=('tar')
url='http://meetfranz.com/'
license=('custom:github' 'MIT' 'ISC')
source=("${pkgname}.sh" "${pkgname}.desktop" "${pkgname}.png" "LICENSE" "CHANGELOG")
source_x86_64=("https://github.com/meetfranz/franz-app/releases/download/4.0.4/Franz-linux-x64-4.0.4.tgz")
sha256sums=('55f541ed100cd41ff2b1a289fff445abf3c0de0f9fcf2c04d722a2563817bbcc'
            '81a676dd83ec0bd9b4b6712555aafcd95e18aeab46257dd5b59123ec5b98587a'
            '6e761371afadf155b8bc25e94fd7de371c16130a87338300e5800924916a7a28'
            'f99c2ecb2bc00e05690dbfd62dbe6a0253ec4e156b097ed79e3cec7c820fbfd8'
            'dd0d0fd89d6f3bcdc1e318e910509035204b461a553ff0d32127e37b25692e0c')
sha256sums_x86_64=('65e63c9aa71c46f391ce5b62bca0b77dcae59d0cef18691e39e4c5ec24a85e6b')
[[ "$CARCH" = "x86_64" ]] && _path="Franz-linux-x64-${pkgver}"
noextract=(${_path})

prepare() {
    install -d ${srcdir}/${_path}/
    tar xf "${srcdir}/${_path}.tgz" -C "${srcdir}/${_path}"
}

package() {
    install -d ${pkgdir}/{opt/franz4-bin,usr/{bin,share/pixmaps}}
    cp -R ${srcdir}/${_path}/* ${pkgdir}/opt/${pkgname}/
    install -Dm755 $srcdir/${pkgname}.sh  ${pkgdir}/usr/bin/${pkgname}
    install -Dm644 $srcdir/${pkgname}.png ${pkgdir}/usr/share/pixmaps/franz.png
    install -Dm644 $srcdir/LICENSE        ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    install -Dm644 $srcdir/CHANGELOG      ${pkgdir}/opt/${pkgname}/CHANGELOG
    desktop-file-install ${srcdir}/${pkgname}.desktop --dir ${pkgdir}/usr/share/applications/
}
