# Maintainer: Phillip Schichtel <phillip.public@schich.tel>
pkgname=jprofiler
pkgver="10.0"
pkgrel=1
options=(!strip)
pkgdesc="The Award-Winning All-in-One Java Profiler"
arch=(any)
url="http://jprofiler.com"
license=('custom')
depends=('java-environment')
source=("http://download-keycdn.ej-technologies.com/jprofiler/jprofiler_linux_$(echo $pkgver | sed 's/\./_/g').tar.gz"
        "${pkgname}.desktop")
sha256sums=('e0fb33a8c5c679aa851368a642ed19fe8e8be9310db7720b4faf0b43e32ff7fa'
            'be6fce730c9be07ca3574c1a390f93d54d8e9ab4a18233f97bc25273beacd33a')

package() {
    optdir="/opt/${pkgname}"
    target="${pkgdir}${optdir}"
    extracted="${srcdir}/jprofiler${pkgver}"
    install -dm755 "$target"
    install -dm755 "${pkgdir}/usr/bin"
    cp -dpr --no-preserve=ownership "${extracted}/." "$target"
    ln -s "${optdir}/bin/jprofiler" "${pkgdir}/usr/bin/${pkgname}"

    install -dm755 "${pkgdir}/etc"
    ln -s "${optdir}/config" "${pkgdir}/etc/${pkgname}"

    hicolor="${pkgdir}/usr/share/icons/hicolor/"
    install -dm755 "${hicolor}/64x64/apps"
    install -dm755 "${hicolor}/32x32/apps"
    install -dm755 "${hicolor}/16x16/apps"

    licensedir="${pkgdir}/usr/share/licenses/${pkgname}"
    install -dm755 "$licensedir"
    mv "${target}/license.txt" "$licensedir"
    mv "${target}/license.html" "$licensedir"

    local image_var="545567"

    cp "${target}/.install4j/i4j_extf_3_${image_var}_u9lgq5@2x.png" "${hicolor}/64x64/apps/${pkgname}.png"
    cp "${target}/.install4j/i4j_extf_3_${image_var}_u9lgq5.png" "${hicolor}/32x32/apps/${pkgname}.png"
    cp "${target}/.install4j/i4j_extf_2_${image_var}_1u8i2ka.png" "${hicolor}/16x16/apps/${pkgname}.png"

    appsdir="${pkgdir}/usr/share/applications"
    install -dm755 "$appsdir"
    cp "${srcdir}/jprofiler.desktop" "$appsdir"

}
