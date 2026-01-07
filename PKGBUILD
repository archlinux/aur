# Maintainer: Moses Narrow <moe_narrow@skycoin.com>
#t.me/Skycoin for inquiries
_pkgname=skycoin
pkgname=${_pkgname}-bin
_projectname=${_pkgname}
_githuborg=${_projectname}
pkgdesc="Skycoin Cryptocurrency Wallet; Binary Release"
pkgver='0.28.2'
_pkggopath="github.com/${_githuborg}/${_pkgname}"
pkgrel='1'
arch=('x86_64' 'aarch64' 'armv8' 'armv7' 'armv7l' 'armv7h' 'armv6h' 'armhf' 'armel' 'arm')
url="https://${_pkggopath}"
#_url="https://downloads.${_projectname}.com/wallet"
license=()
makedepends=()
provides=( 'skycoin' )
conflicts=( 'skycoin' )
#bsdtar -czvf skycoin-scripts.tar.gz skycoin-scripts
source=("${_pkgname}-scripts.tar.gz")
sha256sums=('4f0a38b9586d5fb4ca190b07261b5b63effe5487f8c912388fd040c60e2aa268')
sha256sums_x86_64=('d078ad877a72dacb9d41c017ad55e8359dac34c68282bf70d273e38afcb70218')
sha256sums_aarch64=('4780e8f134d13097c4993264b9dd9c9c918cf390fa1b7bf316b40c74e26371f4')
sha256sums_armv8=('4780e8f134d13097c4993264b9dd9c9c918cf390fa1b7bf316b40c74e26371f4')
sha256sums_armv7=('96d684b7100dc22db129835e168f3db46e5e30872706cc7a88b9d45077ac73a2')
sha256sums_armv7l=('96d684b7100dc22db129835e168f3db46e5e30872706cc7a88b9d45077ac73a2')
sha256sums_armv7h=('96d684b7100dc22db129835e168f3db46e5e30872706cc7a88b9d45077ac73a2')
sha256sums_armv6h=('96d684b7100dc22db129835e168f3db46e5e30872706cc7a88b9d45077ac73a2')
sha256sums_armhf=('ea272d82bbc6b229c7ea45954d2b9b64eb4ea95eccce7a5d948fa558798ac268')
sha256sums_armel=('96d684b7100dc22db129835e168f3db46e5e30872706cc7a88b9d45077ac73a2')
sha256sums_arm=('96d684b7100dc22db129835e168f3db46e5e30872706cc7a88b9d45077ac73a2')
# 'SKIP')
#https://downloads.skycoin.com/wallet/skycoin-0.27.1-gui-standalone-linux-x64.tar.gz
#https://downloads.skycoin.com/wallet/skycoin-0.27.1-gui-standalone-linux-arm.tar.gz
#https://github.com/skycoin/skycoin/releases/download/v0.28.2/skycoin-v0.28.2-linux-386.tar.gz
#https://github.com/skycoin/skycoin/releases/download/v0.28.2/skycoin-v0.28.2-linux-amd64.tar.gz
#https://github.com/skycoin/skycoin/releases/download/v0.28.2/skycoin-v0.28.2-linux-arm.tar.gz
#https://github.com/skycoin/skycoin/releases/download/v0.28.2/skycoin-v0.28.2-linux-arm64.tar.gz
#https://github.com/skycoin/skycoin/releases/download/v0.28.2/skycoin-v0.28.2-linux-armhf.tar.gz
_release_url=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux")
source_x86_64=("${_release_url}-amd64.tar.gz")
source_i686=("${_release_url}-386.tar.gz")
source_aarch64=("${_release_url}-arm64.tar.gz")
source_armv8=( ${source_aarch64[@]} )
source_armv7=("${_release_url}-arm.tar.gz")
source_armv7h=( ${source_armv7[@]} )
source_armv7l=( ${source_armv7[@]} )
source_armv6h=( ${source_armv7[@]} )
source_armhf=("${_release_url}-armhf.tar.gz")
source_armel=( ${source_armv7[@]} )
source_arm=( ${source_armv7[@]} )

package() {
_msg2 'creating dirs'
mkdir -p ${pkgdir}/usr/bin
mkdir -p ${pkgdir}/opt/${_pkgname}/bin
_msg2 'installing binaries'
install -Dm755 ${srcdir}/${_pkgname} ${pkgdir}/opt/${_pkgname}/bin/${_pkgname}
ln -rTsf ${pkgdir}/opt/${_pkgname}/bin/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
chmod 755 ${pkgdir}/usr/bin/${_pkgname}
install -Dm755 ${srcdir}/skyhw ${pkgdir}/opt/${_pkgname}/bin/skyhw
ln -rTsf ${pkgdir}/opt/${_pkgname}/bin/skyhw ${pkgdir}/usr/bin/skyhw
chmod 755 ${pkgdir}/usr/bin/skyhw

_msg2 'installing scripts'
install -Dm755 ${srcdir}/${_pkgname}-scripts/${_pkgname}-wallet ${pkgdir}/usr/bin/${_pkgname}-wallet
install -Dm755 ${srcdir}/${_pkgname}-scripts/${_pkgname}-node ${pkgdir}/usr/bin/${_pkgname}-node

_msg2 'installing systemd services'
install -Dm644 ${srcdir}/${_pkgname}-scripts/${_pkgname}-node.service ${pkgdir}/usr/lib/systemd/system/${_pkgname}-node.service
}

_msg2() {
(( QUIET )) && return
local mesg=$1; shift
printf "${BLUE}  ->${ALL_OFF}${BOLD} ${mesg}${ALL_OFF}\n" "$@"
}
