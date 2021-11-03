# Maintainer: jzbor <zborof@posteo.net>
#
# Manjaro Maintainers:
# Based on a PKGBUILD from:
# Original PKGBUILD By: Bart De Vries <devriesb at gmail dot com>
# Contributor: Furkan Kardame <furkan@fkardame.com>
# Maintainer: Henning Thiemann <hthiemann@hthiemann.tech>

pkgname=chromium-docker
_pkgname=docker-chromium-armhf
pkgdesc='Chromium Docker Image builder with widevine'
pkgver=78.0.3904.97
pkgrel=2
arch=('aarch64')
url='https://github.com/HenningThiemann/docker-chromium-armhf'
license=('custom')
depends=('gcc-libs' 'glib2' 'glibc' 'nspr' 'nss' 'xorg-xhost' 'docker' 'git' 'p7zip' 'paprefs'
    'inetutils' 'vim')
makedepends=('p7zip')
options=()
install=$pkgname.install
source=("git+$url"
        "chrome-eula_text.html::https://www.google.com/intl/en/chrome/privacy/eula_text.html"
        "chromium.png"
        "Chromium-Armv7.desktop")
sha256sums=('SKIP'
            '0d847a4c7dd034af633b3f448fe107efd779e7f1873c587f07a45d3317413bfe'
            '5c1d420c17b308987fda5fe731fc42b5bee3b9bd591aae571fd1cfc14eeb293b'
            '8ab59fc6c58324fcf33bf315c0b675a09ac31354ad99d24ac9cf54b92bb23644')

package() {
    mkdir -vp "${pkgdir}"/usr/share/chromium-docker/
    mkdir -vp "${pkgdir}"/usr/share/applications/
    mkdir -vp "${pkgdir}"/usr/bin/
#cp -r "${_docker_image}-${_commit}"/* -t "${pkgdir}/usr/share/chromium-docker"
#install -Dm644 ${_libwidevine} -t "$pkgdir/usr/lib/chromium/"
    cp -rv "${_pkgname}" "${pkgdir}/usr/share/chromium-docker/"
    mv -v "${pkgdir}/usr/share/chromium-docker/${_pkgname}" "${pkgdir}/usr/share/chromium-docker/git"
    install -Dm755 "${_pkgname}/chromium-armhf" "$pkgdir/usr/bin/"
    install -Dm644 ../chrome-eula_text.html "$pkgdir/usr/share/licenses/$pkgname/eula_text.html"
    install -Dm644 ../chrome-eula_text.html chromium.png "$pkgdir/usr/share/chromium-docker/"
    install -Dm644 Chromium-Armv7.desktop "$pkgdir/usr/share/applications/"
}

