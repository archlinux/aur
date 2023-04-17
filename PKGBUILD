# Maintainer: Leonidas Spyropoulos <artafinde at gmail dot com>

pkgname=intellij-idea-ue-eap
_pkgname=idea-IU
_buildver=231.8770.17
_veryear=2023
_verrelease=1
_verextra=
pkgver=${_veryear}.${_verrelease}.${_buildver}
pkgrel=1
pkgdesc="Early access version of the upcoming version of Intellij Idea IDE (ultimate version)"
arch=('any')
options=(!strip)
url="http://www.jetbrains.com/idea/nextversion"
license=('custom')
depends=('java-environment' 'giflib' 'libxtst' 'libdbusmenu-glib')
_archive="ideaIU-${_buildver}.tar.gz"
source=("https://download.jetbrains.com/idea/${_archive}"
        "intellij-idea-ue-eap.desktop")
sha256sums=($(curl -s "https://download.jetbrains.com/idea/${_archive}.sha256" | cut -f1 -d" ")
            'af5a9e49b921dbdc5b960dedc27e15b2510896ff6e58d983fca7de6a6fd18f38')
package() {
    install -dm755 "${pkgdir}/opt/${pkgname}"
    cp -r --no-preserve='ownership' "${srcdir}/${_pkgname}-${_buildver}/"* "${pkgdir}/opt/${pkgname}"

    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
    find "${srcdir}/${_pkgname}-${_buildver}/license/" -type f -exec \
        install -Dm644 '{}' "${pkgdir}/usr/share/licenses/${pkgname}/" \;

    install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    sed -i "s/_pkgver/${pkgver}/" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    install -dm755 -p "${pkgdir}/usr/bin/"
    ln -s "/opt/${pkgname}/bin/idea.sh" "${pkgdir}/usr/bin/idea-ue-eap"
}

# vim:set ts=4 sw=4 et:
