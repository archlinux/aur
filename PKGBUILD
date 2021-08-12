# Maintainer: taotieren <admin@taotieren.com>

pkgname=homegenie-bin
pkgver=1.3_stable.19
_pkgver=${pkgver/_/-}
pkgrel=1
epoch=
pkgdesc="HomeGenie: Embeddable, Smart Home server for Windows, Mac and Linux."
arch=('any')
url="https://github.com/genielabs/HomeGenie"
license=('GPL3')
groups=()
depends=('bash')
makedepends=("tar")
checkdepends=()
optdepends=()
provides=("HomeGenie")
conflicts=(${pkgname%-bin})
replaces=()
backup=()
options=('!strip')
install=
changelog=
source=("https://hub.fastgit.org/genielabs/HomeGenie/releases/download/v${_pkgver}/${pkgname%-bin}_${_pkgver}.tgz")
# source=("https://hub.fastgit.org/genielabs/HomeGenie/releases/download/v${_pkgver}/${pkgname%-bin}_${_pkgver}_all.deb")
noextract=()
sha256sums=('00b6d57bcfbe42c254d69fbb3510a8bb29fdd70839285826b26311c4b96fb2a6')
#validpgpkeys=()


package() {
#     tar -xf data.tar.xz -C "${pkgdir}"
    install -dm0755 "${pkgdir}/opt/genielabs"
    tar -xf ${pkgname%-bin}_${_pkgver}.tgz -C "${pkgdir}/opt/genielabs"
    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/${pkgname%-bin}" << EOF
#!/bin/env bash
sudo mono /opt/genielabs/${pkgname%-bin}/HomeGenie.exe "\$@"
EOF
#     install -Dm0755 /dev/stdin "${pkgdir}/etc/profile.d/${pkgname%-bin}.sh" << EOF
# !/bin/sh
# [ -d /opt/genielabs/${pkgname%-bin}] && append_path '/opt/genielabs/${pkgname%-bin}'
#
# export PATH
# EOF
}
