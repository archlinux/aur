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
_sdkint=35
pkgname="android-sources"
pkgver="${_sdkint}_${_rev}"
pkgrel=1
pkgdesc="Android SDK Sources, latest API"
arch=('any')
url="https://developer.android.com/studio/index.html"
license=('LicenseRef-custom')
provides=("android-sources-${_sdkint}")
conflicts=("android-sources-${_sdkint}")
options=('!strip' '!debug')
source=("https://dl.google.com/android/repository/source-${_sdkint}_${_rev}.zip"
        "package.xml")
sha256sums=('1a4e6251096a0f03085716f10e7bd859a97837f6314e955729d4f167bb8830d6'
            '1cc817eefcef2a4f3f315f4694e2a21473a32e2b29cfc1f66d2989c60c3dbafe')

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
