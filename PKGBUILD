# Maintainer: Phillip Schichtel <phillip.public@schich.tel>
pkgname=jprofiler12
pkgver=12.0.4
pkgrel=1
options=(!strip)
pkgdesc="The Award-Winning All-in-One Java Profiler (Version 12.x)"
arch=(any)
url="http://jprofiler.com"
license=('custom')
depends=('java-environment')
source=("https://download-gcdn.ej-technologies.com/jprofiler/jprofiler_linux_$(echo $pkgver | sed 's/\./_/g').tar.gz"
        "${pkgname}.desktop"
        "${pkgname}.sh")
sha256sums=('3eabc519a9809d4b9baf2286de462ffdd48d03f2dfb87f39d924bc83ad1d615c'
            '00882f7f3f4d00c8290b4c16557c1c24077d4404f7cea36cc1a248934aceddfa'
            '3eda40fb35206c203a5d5fa286f21bad9c15a9e97b7f5d2c74a6eeab39335777')

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

    local image_var="dcmbrc"
    cp "${target}/.install4j/i4j_extf_5_${image_var}_u9lgq5@2x.png" "${hicolor}/64x64/apps/${pkgname}.png"
    cp "${target}/.install4j/i4j_extf_5_${image_var}_u9lgq5.png" "${hicolor}/32x32/apps/${pkgname}.png"
    cp "${target}/.install4j/i4j_extf_4_${image_var}_1u8i2ka.png" "${hicolor}/16x16/apps/${pkgname}.png"

    local appsdir="${pkgdir}/usr/share/applications"
    install -dm755 "$appsdir"
    cp "${srcdir}/${pkgname}.desktop" "$appsdir"
}
