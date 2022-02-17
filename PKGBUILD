# Maintainer: John-Michael Mulesa <jmulesa at gmail dot com>
# Contributor: kyndair <kyndair at gmail dot com>

pkgname=daikatana-bin
_pkgname=daikatana
pkgver=1.3
_pkgver="1.0_(22142)"
pkgrel=1
pkgdesc="Daikatana 1.3 binary release"
arch=('x86_64')
url="https://bitbucket.org/daikatana13/daikatana"
license=('custom')
makedepends=('innoextract' 'icoutils')
optdepends=('daikatana-data-gog: game data files from GOG'
            'daikatana-data-steam: game data files from Steam')
provides=('daikatana')
source=("daikatana.desktop"
"https://bitbucket.org/daikatana13/daikatana/downloads/Daikatana-Linux-2021-12-20-x64.tar.bz2"
"https://bitbucket.org/daikatana13/daikatana/downloads/pak6-2021-12-19.zip"
"http://dk.toastednet.org/DK13/pak5.zip"
"http://dk.toastednet.org/Maps/pak9.zip"
"http://dk.toastednet.org/Music/Daikatana_OGG_music.zip")
sha256sums=('0fe4bc3bcbc7e30065aefb563112f6e30dc0775a84a613c4495a89edfa8f2995'
            'e2ef9991dc5755c578587dd02c10724133046a544d38a6dba23cb28ce8bac02e'
            '81ff9e2b8e5cf176ba6c3b714d2aa4c0c2abb41a1ee7fdfe623eb2e1d5798a53'
            '39d1cab035340724f990372e51ee332323a9b9c6aead5c46f988559aa6a631cb'
            '065d5063096bd5267cac1e7a64edd85a690d71952aa469abed3deae4f10e8398'
            '5a2c6a7fe376c66edfaa28f5e91ffdf353fc85d54be358fba07009f336662b26')

package() {
    mkdir -p "${pkgdir}/opt/${_pkgname}"
    mkdir -p "${pkgdir}/usr/bin"

    # install data files
    cp -r ${srcdir}/Daikatana-Linux-2021-12-20-x64/* ${pkgdir}/opt/${_pkgname}/
    cp ${srcdir}/*.pak ${pkgdir}/opt/${_pkgname}/data/
    cp ${srcdir}/*.ogg ${pkgdir}/opt/${_pkgname}/data/music/

    # Install Desktop File
    install -D -m 644 "${srcdir}/${_pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Link Executables in /usr/bin
    ln -sf "/opt/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    ln -sf "/opt/${_pkgname}/dkded" "${pkgdir}/usr/bin/dkded"
}
