#@IgnoreInspection BashAddShebang
# Maintainer: Jérémy "Vrakfall" Lecocq <jeremy at artphotolaurent dot be>
# Co-maintainer: Kppqju77 <ju.adde-gmail-com>
# Contributor: Bence Hornák <hornak dot bence at gmail dot com>
# Contributor: lestb <tkhdlstfl dot l plus aur at gmail dot com>
# Contributor:  danyf90 <daniele.formichelli@gmail.com>
# Contributor: Philipp Wolfer <ph.wolfer@gmail.com>
# Contributor: Joel Pedraza <joel@joelpedraza.com>
# Contributor: Jakub Schmidtke <sjakub-at-gmail-dot-com>

_rev=r01
_sdkint=37.0
pkgname="android-sources"
pkgver="${_sdkint}_${_rev}"
pkgrel=4
pkgdesc="Android SDK Sources, latest API"
arch=('any')
url="https://developer.android.com/studio/index.html"
license=('LicenseRef-custom')
provides=("android-sources-${_sdkint}")
conflicts=("android-sources-${_sdkint}")
options=('!strip' '!debug')
source=("https://dl.google.com/android/repository/source-${_sdkint}_${_rev}.zip"
        "package.xml")
sha256sums=('285295b766d9c31dda50cb051ef664673105dd34f63bc6d753bb89925e1d7dd7'
            '44eb5646ebd375126ba14f3b1019623d9e0dfbbf414f18ab326fe6c60793958a')

package() {
    # Install files
    mkdir -p "${pkgdir}/opt/android-sdk/sources/"
    cp -dpr --no-preserve=ownership "${srcdir}/src" "${pkgdir}/opt/android-sdk/sources/android-${_sdkint}"
    chmod -R ugo+rX "${pkgdir}/opt"
    # Install license
    install -D -m 644 "package.xml" "${pkgdir}/usr/share/licenses/${pkgname}/package.xml"
    ln -s "/usr/share/licenses/${pkgname}/package.xml" \
        "${pkgdir}/opt/android-sdk/sources/android-${_sdkint}/"
}
