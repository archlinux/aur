# Maintainer: Leonidas Spyropoulos <artafinde at gmail dot com>

pkgname=intellij-idea-ce-eap
_pkgname=idea-IC
_buildver=231.8770.17
_veryear=2023
_verrelease=1
_verextra=
pkgver=${_veryear}.${_verrelease}.${_buildver}
pkgrel=1
pkgdesc="Early access version of the upcoming version of Intellij Idea IDE (community version)"
arch=('any')
options=(!strip)
url="http://www.jetbrains.com/idea/nextversion"
license=('Apache2')
depends=('java-environment' 'giflib' 'libxtst' 'libdbusmenu-glib')
_archive="ideaIC-${_buildver}.tar.gz"
source=("https://download.jetbrains.com/idea/${_archive}"
        "intellij-idea-ce-eap.desktop")
sha256sums=($(curl -s "https://download.jetbrains.com/idea/${_archive}.sha256" | cut -f1 -d" ")
            '977f062d7db3a4c7bd50c24d2426e3226f7350c575f7cea6f5f50ea637bd1348')
package() {
    install -dm755 "${pkgdir}/opt/${pkgname}"
    cp -r --no-preserve='ownership' "${srcdir}/${_pkgname}-${_buildver}/"* "${pkgdir}/opt/${pkgname}"

    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
    find "${srcdir}/${_pkgname}-${_buildver}/license/" -type f -exec \
        install -Dm644 '{}' "${pkgdir}/usr/share/licenses/${pkgname}/" \;

    install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    sed -i "s/_pkgver/${pkgver}/" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    install -dm755 -p "${pkgdir}/usr/bin/"
    ln -s "/opt/${pkgname}/bin/idea.sh" "${pkgdir}/usr/bin/idea-ce-eap"
}

# vim:set ts=4 sw=4 et:
