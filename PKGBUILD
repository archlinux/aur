# Maintainer: Phillip Schichtel <phillip.public@schich.tel>
pkgname=jprofiler
pkgver="10.0.1"
pkgrel=1
options=(!strip)
pkgdesc="The Award-Winning All-in-One Java Profiler"
arch=(any)
url="http://jprofiler.com"
license=('custom')
depends=('java-environment')
source=("http://download-keycdn.ej-technologies.com/jprofiler/jprofiler_linux_$(echo $pkgver | sed 's/\./_/g').tar.gz"
        "${pkgname}.desktop")
sha256sums=('836596c6486fc8a54d14bc7c7af52baa3e1b35a49dc4d6967a0d47c6770aafdc'
            'be6fce730c9be07ca3574c1a390f93d54d8e9ab4a18233f97bc25273beacd33a')

package() {
    local optdir="/opt/${pkgname}"
    local target="${pkgdir}${optdir}"
    local extracted="${srcdir}/jprofiler${pkgver}"
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

    local image_var="545567"

    cp "${target}/.install4j/i4j_extf_3_${image_var}_u9lgq5@2x.png" "${hicolor}/64x64/apps/${pkgname}.png"
    cp "${target}/.install4j/i4j_extf_3_${image_var}_u9lgq5.png" "${hicolor}/32x32/apps/${pkgname}.png"
    cp "${target}/.install4j/i4j_extf_2_${image_var}_1u8i2ka.png" "${hicolor}/16x16/apps/${pkgname}.png"

    local appsdir="${pkgdir}/usr/share/applications"
    install -dm755 "$appsdir"
    cp "${srcdir}/${pkgname}.desktop" "$appsdir"

}
