# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
# Maintainer: Rudi [KittyCash] <rudi@skycoinmail.com>
_pkgname=skywire
pkgname=${_pkgname}-bin
_projectname=skycoin
_githuborg=${_projectname}
pkgdesc="Skywire: Building a New Internet. Skycoin.com"
_pkgver='0.3.0'
_tag_ver="v${_pkgver}"
pkgver=${_pkgver//-/.}
_pkggopath="github.com/${_githuborg}/${_pkgname}"
pkgrel=2
arch=( 'i686' 'x86_64' 'aarch64' 'armv8' 'armv7' 'armv7l' 'armv7h' 'armv6h' 'armhf' 'armel' 'arm' )
url="https://${_pkggopath}"
makedepends=()
depends=()
provides=( 'skywire' )
conflicts=( 'skywire' )
#install=skywire.install
#source=("${_pkgname}-scripts.tar.gz")
# "PKGBUILD.sig")
#sha256sums=('fff8b9f7d4e60c8993497a963161f934d445f4d7cf2ff47bc787dcb459c8b351')
#            'SKIP')
#https://github.com/skycoin/skywire/releases/download/v0.3.0/skywire-v0.3.0-linux-amd64.tar.gz
#https://github.com/skycoin/skywire/releases/download/v0.3.0/skywire-v0.3.0-linux-386.tar.gz
#https://github.com/skycoin/skywire/releases/download/v0.3.0/skywire-v0.3.0-linux-arm64.tar.gz
#https://github.com/skycoin/skywire/releases/download/v0.3.0/skywire-v0.3.0-linux-arm.tar.gz
_release_url=("${url}/releases/download/${_tag_ver}/${_pkgname}-${_tag_ver}-linux")
source_x86_64=("${_release_url}-amd64.tar.gz")
source_aarch64=("${_release_url}-arm64.tar.gz")
source_armv8=( ${source_aarch64[@]} )
source_arm=("${_release_url}-arm.tar.gz")
source_armv7=( ${source_arm[@]} )
source_armv7l=( ${source_arm[@]} )
source_armv7h=( ${source_arm[@]} )
source_i686=("${_release_url}-386.tar.gz")
sha256sums_x86_64=('dffd28740b051bf07764fa254bf2be15a56dfd6390860541f660aef03fe71856')
sha256sums_aarch64=('ac8cadc15a506f324718cdc9a549ccefa9459e88367441361a6395d330bfcf8b')
sha256sums_armv8=( ${sha256sums_aarch64[@]} )
sha256sums_arm=('271e6f175ee3382287929ff0eb298712427d64f4cfb930b3b75277a3ace500b2')
sha256sums_armv7=( ${sha256sums_arm[@]} )
sha256sums_armv7l=( ${sha256sums_arm[@]} )
sha256sums_armv7h=( ${sha256sums_arm[@]} )
sha256sums_i686=('d74b659aca0e3b90c05cf2b31de9bdbd44f6a4a69a4a0a083f7c44454be3012a')

# validpgpkeys=('DE08F924EEE93832DABC642CA8DC761B1C0C0CFC')  # Moses Narrow <moe_narrow@use.startmail.com>
#'98F934F04F9334B81DFA3398913BBD5206B19620') #iketheadore skycoin <luxairlake@protonmail.com>

#tar -czvf skywire-scripts.tar.gz skywire-scripts
#updpkgsums

#prepare() {
#verify PKGBUILD signature
#gpg --verify ${srcdir}/PKGBUILD.sig ../PKGBUILD
# https://wiki.archlinux.org/index.php/Go_package_guidelines
#}

package() {
  _msg2 'creating dirs'
#create directory trees or the visor might make them with weird permissions
_skydir="opt/skywire"
_skyapps="${_skydir}/apps"
_systemddir="etc/systemd/system"
_skybin="${_skydir}/bin"
mkdir -p ${pkgdir}/usr/bin
mkdir -p ${pkgdir}/${_skydir}/bin
mkdir -p ${pkgdir}/${_skydir}/apps
mkdir -p ${pkgdir}/${_skydir}/ssl
mkdir -p ${pkgdir}/${_skydir}/local
mkdir -p ${pkgdir}/${_skydir}/dmsgpty
mkdir -p ${pkgdir}/${_skydir}/${_pkgname}
#mkdir -p ${pkgdir}/${_skydir}/${_pkgname}-save
mkdir -p ${pkgdir}/${_skydir}/transport_logs
#mkdir -p ${pkgdir}/${_skydir}/sky-local
#mkdir -p ${pkgdir}/${_skydir}/hypervisorkey


_msg2 'installing binaries'
_msg3 'skywire-hypervisor'
install -Dm755 ${srcdir}/hypervisor ${pkgdir}/${_skybin}/
ln -rTsf ${pkgdir}/${_skybin}/hypervisor ${pkgdir}/usr/bin/${_pkgname}-hypervisor
_msg3 'skywire-visor'
install -Dm755 ${srcdir}/${_pkgname}-visor ${pkgdir}/${_skybin}/
ln -rTsf ${pkgdir}/${_skybin}/${_pkgname}-visor ${pkgdir}/usr/bin/${_pkgname}-visor
_msg3 'skywire-cli'
install -Dm755 ${srcdir}/${_pkgname}-cli ${pkgdir}/${_skybin}/
ln -rTsf ${pkgdir}/${_skybin}/${_pkgname}-cli ${pkgdir}/usr/bin/${_pkgname}-cli
_msg2 'installing app binaries'
_msg3 'skychat'
install -Dm755 ${srcdir}/apps/skychat ${pkgdir}/${_skyapps}/
_msg3 'skysocks'
install -Dm755 ${srcdir}/apps/skysocks ${pkgdir}/${_skyapps}/
_msg3 'skysocks-client'
install -Dm755 ${srcdir}/apps/skysocks-client ${pkgdir}/${_skyapps}/
_msg3 'vpn-client'
install -Dm755 ${srcdir}/apps/vpn-client ${pkgdir}/${_skyapps}/
_msg3 'vpn-server'
install -Dm755 ${srcdir}/apps/vpn-server ${pkgdir}/${_skyapps}/

#install scripts
#install -Dm755 ${srcdir}/${_scripts}/${_pkgname}-halt.sh ${pkgdir}/usr/bin/${_pkgname}-halt
#install -Dm755 ${srcdir}/${_scripts}/${_pkgname}-setuser.sh ${pkgdir}/usr/bin/${_pkgname}-setuser

#install the PKGBUILD for generating the config backup (and restoration?) scripts
#install -Dm755 ${srcdir}/${_scripts}/${_pkgname}-save.sh ${pkgdir}/usr/bin/${_pkgname}-save
#install -Dm755 ${srcdir}/${_scripts}/${_pkgname}-restore.sh ${pkgdir}/usr/bin/${_pkgname}-restore
#install -Dm755 ${srcdir}/${_scripts}/${_pkgname}-autoconfig.sh ${pkgdir}/usr/bin/${_pkgname}-autoconfig
#install -Dm755 ${srcdir}/${_scripts}/${_pkgname}-reset.sh ${pkgdir}/usr/bin/${_pkgname}-reset

#install -Dm755  ${srcdir}/${_scripts}/${_pkgname}-save.PKGBUILD  ${pkgdir}/${_skydir}/${_pkgname}-save/PKGBUILD
#install -Dm755 ${srcdir}/${_scripts}/${_pkgname}-save.install ${pkgdir}/${_skydir}/${_pkgname}-save/${_pkgname}-save.install

#install the satellite PKGBUILD for distributing the hypervisor key and it's script
#install -Dm755 ${srcdir}/${_scripts}/keypkg-gen.sh ${pkgdir}/usr/bin/keypkg-gen
#install -Dm755  ${srcdir}/${_scripts}/hypervisorkey.PKGBUILD  ${pkgdir}/${_skydir}/hypervisorkey/PKGBUILD
#install -Dm755 ${srcdir}/${_scripts}/hypervisorkey.install ${pkgdir}/${_skydir}/hypervisorkey/hypervisorkey.install
#install -Dm755 ${srcdir}/${_scripts}/hypervisorkey-autoconfig.sh ${pkgdir}/${_skydir}/hypervisorkey/hypervisorkey-autoconfig.sh

#rename visor to skywire
#mv ${pkgdir}/usr/bin/${_pkgname}-visor ${pkgdir}/usr/bin/${_pkgname}

#install the system.d services (from the source)
#install -Dm644 ${srcdir}/go/src/${_pkggopath}/init/${_pkgname}-hypervisor.service ${pkgdir}/usr/lib/systemd/system/${_pkgname}-hypervisor.service
#install -Dm644 ${srcdir}/go/src/${_pkggopath}/init/${_pkgname}-visor.service ${pkgdir}/usr/lib/systemd/system/${_pkgname}-visor.service

#install the patched system.d services
#install -Dm644 ${srcdir}/${_scripts}/${_pkgname}.service ${pkgdir}/usr/lib/systemd/system/${_pkgname}.service
#install -Dm644 ${srcdir}/${_scripts}/${_pkgname}-visor.service ${pkgdir}/usr/lib/systemd/system/${_pkgname}-visor.service

#tls key and certificate generation
#install -Dm755 ${srcdir}/${_pkgname}/static/skywire-manager-src/ssl/generate-1.sh ${pkgdir}/${_skydir}/ssl/generate.sh
#install -Dm755 ${srcdir}/${_scripts}/generate.sh ${pkgdir}/${_skydir}/ssl/generate.sh
#ln -rTsf ${pkgdir}/${_skydir}/ssl/generate.sh ${pkgdir}/usr/bin/${_pkgname}-tls-gen
#install -Dm644 ${srcdir}/${_pkgname}/static/${_pkgname}-manager-src/ssl/certificate.cnf ${pkgdir}/${_skydir}/ssl/certificate.cnf
}

_msg2() {
(( QUIET )) && return
local mesg=$1; shift
printf "${BLUE}  ->${ALL_OFF}${BOLD} ${mesg}${ALL_OFF}\n" "$@"
}

_msg3() {
(( QUIET )) && return
local mesg=$1; shift
printf "${BLUE}  -->${ALL_OFF}${BOLD} ${mesg}${ALL_OFF}\n" "$@"
}
