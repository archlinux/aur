# Maintainer: Phillip Schichtel <phillip.public@schich.tel>
pkgname=jprofiler
pkgver=15.0.1
pkgrel=1
options=(!strip)
pkgdesc="The Award-Winning All-in-One Java Profiler"
arch=(any)
url="http://jprofiler.com"
license=('custom')
depends=('java-environment')
source=("https://download-gcdn.ej-technologies.com/jprofiler/jprofiler_linux_$(echo $pkgver | sed 's/\./_/g').tar.gz"
        "${pkgname}.desktop"
        "${pkgname}.sh")
sha256sums=('5a01248625a280564ebde3d0f8a28c057b9b9547abca0c7a9a6fcb461e6c5d37'
            'be6fce730c9be07ca3574c1a390f93d54d8e9ab4a18233f97bc25273beacd33a'
            'ccd3b8ffdefc25f5845263f087776153ec5269a68fe65970fe92e68e1dcf7e36')

package() {
    local optdir="/opt/${pkgname}"
    local target="${pkgdir}${optdir}"
    local extracted="${srcdir}/jprofiler${pkgver}"
    install -dm755 "$target"
    install -dm755 "${pkgdir}/usr/bin"
    install -m755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    cp -dpr --no-preserve=ownership "${extracted}/." "$target"

    install -dm755 "${pkgdir}/etc"
    ln -s "${optdir}/config" "${pkgdir}/etc/${pkgname}"

    local hicolor="${pkgdir}/usr/share/icons/hicolor/"
    install -dm755 "${hicolor}/512x512/apps"
    install -dm755 "${hicolor}/256x256/apps"
    install -dm755 "${hicolor}/64x64/apps"
    install -dm755 "${hicolor}/32x32/apps"
    install -dm755 "${hicolor}/16x16/apps"

    local licensedir="${pkgdir}/usr/share/licenses/${pkgname}"
    install -dm755 "$licensedir"
    mv "${target}/license.txt" "$licensedir"
    mv "${target}/license.html" "$licensedir"

    local image_var="v3vxop"
    cp "${target}/.install4j/i4j_extf_10_${image_var}_92xp8q@2x.png" "${hicolor}/512x512/apps/${pkgname}.png"
    cp "${target}/.install4j/i4j_extf_10_${image_var}_92xp8q.png" "${hicolor}/256x256/apps/${pkgname}.png"
    cp "${target}/.install4j/i4j_extf_9_${image_var}_1x4rayh@2x.png" "${hicolor}/64x64/apps/${pkgname}.png"
    cp "${target}/.install4j/i4j_extf_9_${image_var}_1x4rayh.png" "${hicolor}/32x32/apps/${pkgname}.png"
    cp "${target}/.install4j/i4j_extf_8_${image_var}_ozp0zm.png" "${hicolor}/16x16/apps/${pkgname}.png"

    local appsdir="${pkgdir}/usr/share/applications"
    install -dm755 "$appsdir"
    cp "${srcdir}/${pkgname}.desktop" "$appsdir"
}
