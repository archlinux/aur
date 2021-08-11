# Maintainer: Phillip Schichtel <phillip.public@schich.tel>
pkgname=jprofiler9
pkgver=9.2.1
pkgrel=1
options=(!strip)
pkgdesc="The Award-Winning All-in-One Java Profiler (Version 9.x)"
arch=(any)
url="http://jprofiler.com"
license=('custom')
depends=('java-environment')
source=("https://download-gcdn.ej-technologies.com/jprofiler/jprofiler_linux_$(echo $pkgver | sed 's/\./_/g').tar.gz"
        "${pkgname}.desktop")
sha256sums=('f6bba9ef5391cefcd206aae93669479052081f9ee863c323eea793119039b8a6'
            '423b3d10bfa13e8c76ed5136c9721dabea21acef8b288660e8983d099100d850')

package() {
    local optdir="/opt/${pkgname}"
    local target="${pkgdir}${optdir}"
    local major_ver="9"
    local extracted="${srcdir}/jprofiler${major_ver}"
    install -dm755 "$target"
    install -dm755 "${pkgdir}/usr/bin"
    cp -dpr --no-preserve=ownership "${extracted}/." "$target"
    ln -s "${optdir}/bin/jprofiler" "${pkgdir}/usr/bin/${pkgname}"

    install -dm755 "${pkgdir}/etc"
    ln -s "${optdir}/config" "${pkgdir}/etc/${pkgname}"

    local hicolor="${pkgdir}/usr/share/icons/hicolor/"
    install -dm755 "${hicolor}/64x64/apps"
    install -dm755 "${hicolor}/32x32/apps"
    install -dm755 "${hicolor}/16x16/apps"

    local licensedir="${pkgdir}/usr/share/licenses/${pkgname}"
    install -dm755 "$licensedir"
    mv "${target}/license.txt" "$licensedir"
    mv "${target}/license.html" "$licensedir"

    local image_var="1nklpoz"

    cp "${target}/.install4j/i4j_extf_3_${image_var}_u9lgq5@2x.png" "${hicolor}/64x64/apps/${pkgname}.png"
    cp "${target}/.install4j/i4j_extf_3_${image_var}_u9lgq5.png" "${hicolor}/32x32/apps/${pkgname}.png"
    cp "${target}/.install4j/i4j_extf_2_${image_var}_1u8i2ka.png" "${hicolor}/16x16/apps/${pkgname}.png"

    local appsdir="${pkgdir}/usr/share/applications"
    install -dm755 "$appsdir"
    cp "${srcdir}/${pkgname}.desktop" "$appsdir"

}
