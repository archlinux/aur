# Maintainer: Phillip Schichtel <phillip.public@schich.tel>
pkgname=jprofiler
_majver='9'
pkgver="${_majver}.1.1"
pkgrel=1
pkgdesc="The Award-Winning All-in-One Java Profiler"
arch=(any)
url="http://jprofiler.com"
license=('custom')
depends=('java-environment')
source=("http://download-keycdn.ej-technologies.com/jprofiler/jprofiler_linux_$(echo $pkgver | sed 's/\./_/g').tar.gz"
        "${pkgname}.desktop")
sha256sums=(46756992b5f004a0d5043b9dd74c1813cb0cf7752371492c4a41d1d1bf8bb1b0
            be6fce730c9be07ca3574c1a390f93d54d8e9ab4a18233f97bc25273beacd33a)

package() {
    optdir="/opt/${pkgname}"
    target="${pkgdir}${optdir}"
    extracted="${srcdir}/jprofiler${_majver}"
    install -dm755 "$target"
    install -dm755 "${pkgdir}/usr/bin"
    cp -dpr --no-preserve=ownership "${extracted}/." -d "$target"
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

    cp "${target}/.install4j/i4j_extf_3_1nklpoz_u9lgq5@2x.png" "${hicolor}/64x64/apps/${pkgname}.png"
    cp "${target}/.install4j/i4j_extf_3_1nklpoz_u9lgq5.png" "${hicolor}/32x32/apps/${pkgname}.png"
    cp "${target}/.install4j/i4j_extf_2_1nklpoz_1u8i2ka.png" "${hicolor}/16x16/apps/${pkgname}.png"

    appsdir="${pkgdir}/usr/share/applications"
    install -dm755 "$appsdir"
    cp "${srcdir}/jprofiler.desktop" "$appsdir"

}
