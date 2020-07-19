# Maintainer: Bryce Beagle <first dot last at gmail dot com>
# Contributor: Giampaolo Mancini <mancho at trmpln dot com>
# Contributor: wenLiangcan <boxeed at gmail dot com>
# Contributor: Dustin Falgout <dustin@falgout.us>
# Contributor: Gifts <gifts.antichat@gmail.com>
# Contributor: Andrey Vlasovskikh <andrey.vlasovskikh@gmail.com>

pkgname=rider-eap
pkgver=202.6250.18
eapver=2020.2
eaprelease=7
_dlver="${eapver}-EAP${eaprelease}-${pkgver}.Checked"
pkgrel=1
epoch=1
pkgdesc="A cross-platform C# IDE by JetBrains."
arch=('any')
options=('!strip')
url="https://www.jetbrains.com/rider/eap/"
license=("custom")
optdepends=('mono: .NET runtime' 'msbuild-15-bin: build .NET Core projects')
provides=("rider-eap")
groups=("development" "IDE" "editor" "jetbrains")

source=("https://download-cf.jetbrains.com/rider/JetBrains.Rider-${_dlver}.tar.gz"
        "${pkgname}.desktop")
sha256sums=('cb8d76aaac0a232522e737f86331dc90e001b90b73871ce290c3f954c3fb2758'
            'ada362803d6d2b5ff84680277694d0ecdcb97d46f85d140f79850500966f1ecf')

package() {
    cd "${srcdir}"
    install -dm 755 \
        "${pkgdir}/usr/share/${pkgname}" \
        "${pkgdir}/usr/bin/" \
        "${pkgdir}/usr/share/applications/"

    cp -R --no-preserve=ownership "${srcdir}/JetBrains Rider-${pkgver}/"* "${pkgdir}/usr/share/${pkgname}"

    install -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/"
    ln -s "/usr/share/${pkgname}/bin/rider.sh" "${pkgdir}/usr/bin/rider-eap"
}
