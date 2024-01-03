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
_dl_rev=r01
_sdkint=34
pkgname="android-sources"
pkgver="${_sdkint}_${_rev}"
pkgrel=1
pkgdesc="Android SDK Sources, latest API"
arch=('any')
url="https://developer.android.com/studio/index.html"
license=('custom')
conflicts=("android-sources-${_sdkint}")
options=('!strip')
source=("https://dl.google.com/android/repository/sources-${_sdkint}_${_dl_rev}.zip"
        "package.xml")
sha256sums=('152505964344e17cbfcd56b4ef7afde7e4d60e9892136bc12f423b06566c1430'
            '9a9074639babb0381a63d88355a0fc2b1f9588f2edfa78a095aa82e592afa18c')

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
