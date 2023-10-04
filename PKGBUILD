# Maintainer: Phillip Schichtel <phillip.public@schich.tel>
pkgname=jprofiler
pkgver=14.0
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
sha256sums=('ff2dd37a54a9ecf209592df4509d4d0aeb7f17e812b856ce2d69d506a81633bf'
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
    install -dm755 "${hicolor}/64x64/apps"
    install -dm755 "${hicolor}/32x32/apps"
    install -dm755 "${hicolor}/16x16/apps"

    local licensedir="${pkgdir}/usr/share/licenses/${pkgname}"
    install -dm755 "$licensedir"
    mv "${target}/license.txt" "$licensedir"
    mv "${target}/license.html" "$licensedir"

    local image_var="1u09tly"
    cp "${target}/.install4j/i4j_extf_5_${image_var}_u9lgq5@2x.png" "${hicolor}/64x64/apps/${pkgname}.png"
    cp "${target}/.install4j/i4j_extf_5_${image_var}_u9lgq5.png" "${hicolor}/32x32/apps/${pkgname}.png"
    cp "${target}/.install4j/i4j_extf_4_${image_var}_1u8i2ka.png" "${hicolor}/16x16/apps/${pkgname}.png"

    local appsdir="${pkgdir}/usr/share/applications"
    install -dm755 "$appsdir"
    cp "${srcdir}/${pkgname}.desktop" "$appsdir"
}
