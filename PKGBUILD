#@IgnoreInspection BashAddShebang
# Maintainer: Jérémy "Vrakfall" Lecocq <jeremy at artphotolaurent dot be>
# Co-maintainer: Kppqju77 <ju.adde-gmail-com>
# Contributor: Bence Hornák <hornak dot bence at gmail dot com>
# Contributor: lestb <tkhdlstfl dot l plus aur at gmail dot com>
# Contributor:  danyf90 <daniele.formichelli@gmail.com>
# Contributor: Philipp Wolfer <ph.wolfer@gmail.com>
# Contributor: Joel Pedraza <joel@joelpedraza.com>
# Contributor: Jakub Schmidtke <sjakub-at-gmail-dot-com>

_rev=r02
_sdkint=37.0
pkgname="android-sources"
pkgver="${_sdkint}_${_rev}"
pkgrel=5
pkgdesc="Android SDK Sources, latest API"
arch=('any')
url="https://developer.android.com/studio/index.html"
license=('LicenseRef-custom')
provides=("android-sources-${_sdkint}")
conflicts=("android-sources-${_sdkint}")
options=('!strip' '!debug')
source=("https://dl.google.com/android/repository/source-${_sdkint}_${_rev}.zip"
        "package.xml")
sha256sums=('a853f452b8ba94933eb56ed4e0f622991f9d6de6e0ac19923aa47414d79b9129'
            'e7dad9312dca38886b38d58ac37cdfaece57b15a14b94f8a1f276ea7c9a52d09')

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
