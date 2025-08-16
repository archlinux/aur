# Maintainer: Plague-doctor <plague at privacyrequired dot com >
# Co-maintainer: bacteriostat <dev dot bacteriostat at aleeas dot com>
# Credit for simplifying build goes to Martin Cihlář.

_pkgname=freetube
pkgname=${_pkgname}-bin
pkgver=0.23.7
pkgrel=1
pkgdesc="An open source desktop YouTube player built with privacy in mind."
arch=('x86_64' 'aarch64')
url='https://github.com/FreeTubeApp/FreeTube'
license=('AGPL3')
options=('!strip' 'staticlibs')
depends=('ttf-liberation')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("${pkgname}-${pkgver}-amd64.deb"::"$url/releases/download/v$pkgver-beta/${_pkgname}_${pkgver}_beta_amd64.deb")
source_aarch64=("${pkgname}-${pkgver}-arm64.deb"::"$url/releases/download/v$pkgver-beta/${_pkgname}_${pkgver}_beta_arm64.deb")

prepare() {
    mkdir -p data
    bsdtar -x -f data.tar.xz -C data
}

package() {
    install -d "$pkgdir/usr/bin"
    cp -a  ${srcdir}/data/* ${pkgdir}/
    ln -s "/opt/FreeTube/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}

sha256sums_x86_64=('f1b42942088ea6640e81dbced0c4efda5d5d54129f718c8848f9ae791d9fdf0a')
sha256sums_aarch64=('8d4b748f2c8407cf6ef9167fc91869be0950b259a0433e93331b4e84a89473a9')
