# Maintainer: Phillip Schichtel <phillip.public@schich.tel>
pkgname=jprofiler13
pkgver=13.0.7
pkgrel=1
options=(!strip)
pkgdesc="The Award-Winning All-in-One Java Profiler (Version 13.x)"
arch=(any)
url="http://jprofiler.com"
license=('custom')
depends=('java-environment')
source=("https://download-gcdn.ej-technologies.com/jprofiler/jprofiler_linux_$(echo $pkgver | sed 's/\./_/g').tar.gz"
        "${pkgname}.desktop"
        "${pkgname}.sh")
sha256sums=('0bc2f47de36d2769f69197dabe597e587f6191418beb6528651df6dd5f709156'
            '83518b656d4ffcf5c24e1f9cde39a297dda1916a0dd179c83807978d6d91e2e2'
            '877a4a410d01f47bc86881bf183b7a1bdf8d4c5a28c668be5ff0ac9ca5b85769')

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
    install -dm755 "${hicolor}/64x64/apps"
    install -dm755 "${hicolor}/32x32/apps"
    install -dm755 "${hicolor}/16x16/apps"

    local licensedir="${pkgdir}/usr/share/licenses/${pkgname}"
    install -dm755 "$licensedir"
    mv "${target}/license.txt" "$licensedir"
    mv "${target}/license.html" "$licensedir"

    local image_var="n23wev"
    cp "${target}/.install4j/i4j_extf_5_${image_var}_u9lgq5@2x.png" "${hicolor}/64x64/apps/${pkgname}.png"
    cp "${target}/.install4j/i4j_extf_5_${image_var}_u9lgq5.png" "${hicolor}/32x32/apps/${pkgname}.png"
    cp "${target}/.install4j/i4j_extf_4_${image_var}_1u8i2ka.png" "${hicolor}/16x16/apps/${pkgname}.png"

    local appsdir="${pkgdir}/usr/share/applications"
    install -dm755 "$appsdir"
    cp "${srcdir}/${pkgname}.desktop" "$appsdir"
}
