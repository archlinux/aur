# Maintainer: Phillip Schichtel <phillip.public@schich.tel>
pkgname=jprofiler10
pkgver=10.1.5
pkgrel=1
options=(!strip)
pkgdesc="The Award-Winning All-in-One Java Profiler (Version 10.x)"
arch=(any)
url="http://jprofiler.com"
license=('custom')
depends=('java-environment<=9')
source=("https://download-gcdn.ej-technologies.com/jprofiler/jprofiler_linux_$(echo $pkgver | sed 's/\./_/g').tar.gz"
        "${pkgname}.desktop"
        "${pkgname}.sh")
sha256sums=('e063be99201a3382c9b038f8e46e86436531314c2c38e18a8bae9d2907d86cfe'
            '590d69cbc227fa7a0a3d274fca6423c1a113768264b67e7d9f6e6f121d650cea'
            '7dcd6fc0d748b448f6a08dcb2c7c12c428798728484e0fd8404af6780e59aecd')

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

    local image_var="545567"

    cp "${target}/.install4j/i4j_extf_3_${image_var}_u9lgq5@2x.png" "${hicolor}/64x64/apps/${pkgname}.png"
    cp "${target}/.install4j/i4j_extf_3_${image_var}_u9lgq5.png" "${hicolor}/32x32/apps/${pkgname}.png"
    cp "${target}/.install4j/i4j_extf_2_${image_var}_1u8i2ka.png" "${hicolor}/16x16/apps/${pkgname}.png"

    local appsdir="${pkgdir}/usr/share/applications"
    install -dm755 "$appsdir"
    cp "${srcdir}/${pkgname}.desktop" "$appsdir"
}
