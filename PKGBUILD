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
_sdkint=36
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
sha256sums=('bd97900346a70c784ac8b15c809539ddef34ed3b5be1df8a9a89cf298be93798'
            'c073fb89484b6790ad71e8a500a4a53f78148e38866d14b714b34425cb525f7d')

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
