# Maintainer: haohao3001 <haohao3001 at outlook.com dot com>

pkgname=intellij-idea-open-eap-bin
_pkgname=intellij-idea-open-eap
_buildver=261.22158.277
_veryear=2026
_verrelease=1
_verextra=
_verextraextra=
pkgver=${_veryear}.${_verrelease}.${_buildver}
pkgrel=1
pkgdesc="Early access version of the upcoming version of Intellij Idea IDE (community version)"
arch=('x86_64' 'aarch64')
options=(!strip !debug)
url="http://www.jetbrains.com/idea/nextversion"
license=('Apache-2.0')
depends=('giflib' 'libxtst' 'libxrender')
optdepends=(
    'libdbusmenu-glib: For global menu support'
  )
provides=("intellij-idea-open-eap")
conflicts=("intellij-idea-open-eap")
_archive="idea-${_veryear}.${_verrelease}.tar.gz"
source=("intellij-idea-open-eap.desktop")
source_x86_64=("https://github.com/JetBrains/intellij-community/releases/download/idea%2F${_veryear}.${_verrelease}/idea-${_veryear}.${_verrelease}.tar.gz")
source_aarch64=("https://github.com/JetBrains/intellij-community/releases/download/idea%2F${_veryear}.${_verrelease}/idea-${_veryear}.${_verrelease}-aarch64.tar.gz")
sha256sums=('f3b7e72b21ad2ff5b6db0d43fd1c1fb2a1bc315b733bb33de4bf518351244b65')
sha256sums_x86_64=('264f1e44c85de2b49f4b6b462d39d19c92cd5d4aabe23447d9716fd1b5d9f1a1')
sha256sums_aarch64=('284fa334ff17c8e559a708f4c13b33ecba110d9c01e8dc1bc8edb9820857e5b9')
package() {
    install -dm755 "${pkgdir}/opt/${_pkgname}"
    cp -r --no-preserve='ownership' "${srcdir}/idea-IC-${_buildver}/"* "${pkgdir}/opt/${_pkgname}"

    install -dm755 "${pkgdir}/usr/share/licenses/${_pkgname}"
    find "${srcdir}/idea-IC-${_buildver}/license/" -type f -exec \
        install -Dm644 '{}' "${pkgdir}/usr/share/licenses/${_pkgname}/" \;

    install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    sed -i "s/_pkgver/${pkgver}/" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    install -dm755 -p "${pkgdir}/usr/bin/"
    ln -s "/opt/${_pkgname}/bin/idea" "${pkgdir}/usr/bin/idea-open-eap"
}

# vim:set ts=4 sw=4 et:
