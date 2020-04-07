# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
# Maintainer: Rudi [KittyCash] <rudi@skycoinmail.com>
projectname=skycoin
pkgname=skywire
githuborg=SkycoinProject
pkgdesc="Skywire: Building a New Internet. Skycoin.com"
pkgver=0.2.0
pkggopath="github.com/${githuborg}/${pkgname}-mainnet"
pkgrel=1
arch=('x86_64' 'aarch64' 'armv7' 'armv8')
url="https://${pkggopath}"
license=()
makedepends=(git skycoin-keyring)
#source=("git+${url}.git#branch=${BRANCH:-develop}"
source=("git+https://github.com/SkycoinProject/skybian.git#branch=${BRANCH:-develop}"
"skywire-scripts.tar.gz"
"hypervisorconfigPKGBUILD"
"PKGBUILD.sig")
sha256sums=('SKIP'
'a5f90034db1b199a3fede6b2b23453e234aa366c1ee06dbe3ddfc16f26a0c3a7'
'399926d8addcde6bb588a67739971525f953060b83693cb2a7a081480c4c5091'
'SKIP')
source_x86_64=("https://github.com/SkycoinProject/skywire-mainnet/releases/download/v0.2.0/skywire-v0.2.0-linux-amd64.tar.gz")
sha256sums_x86_64=('988a9925b1650424a97836951b284e633fc78e857b908d65e40cbf6d18eb96d7')
source_aarch64=("https://github.com/SkycoinProject/skywire-mainnet/releases/download/v0.2.0/skywire-v0.2.0-linux-arm64.tar.gz")
sha256sums_aarch64=('5ee60c5b7ce63999520167ab44b7f3b7a2328ea9ebbbabe043cc5245b50d5a81')
source_armv7=("https://github.com/SkycoinProject/skywire-mainnet/releases/download/v0.2.0/skywire-v0.2.0-linux-armv7.tar.gz")
sha256sums_aarch64=('6ebadb2b6dbba87a060993560fe957d617f40ca7e467129889d51baebe57fa47')
source_armv8=("https://github.com/SkycoinProject/skywire-mainnet/releases/download/v0.2.0/skywire-v0.2.0-linux-arm64.tar.gz")
sha256sums_armv8=('5ee60c5b7ce63999520167ab44b7f3b7a2328ea9ebbbabe043cc5245b50d5a81')

validpgpkeys=('DE08F924EEE93832DABC642CA8DC761B1C0C0CFC'  # Moses Narrow <moe_narrow@use.startmail.com>
'98F934F04F9334B81DFA3398913BBD5206B19620') #iketheadore skycoin <luxairlake@protonmail.com>
#tar -czvf skywire-scripts.tar.gz skywire-scripts


prepare() {
	#verify PKGBUILD signature
	gpg --verify ${srcdir}/PKGBUILD.sig ../PKGBUILD
	# https://wiki.archlinux.org/index.php/Go_package_guidelines
}


package() {
    options=(!strip staticlibs)
  #create directory trees
  mkdir -p ${pkgdir}/usr/bin/apps
  mkdir -p ${pkgdir}/etc/skywire
  mkdir -p ${pkgdir}/usr/lib/${projectname}/${pkgname}/hypervisorconfig/
  #mkdir -p ${pkgdir}/usr/lib/${projectname}/${pkgname}/setup-node

  msg2 'installing binaries'
  install -Dm755 ${srcdir}/hypervisor ${pkgdir}/usr/bin/skywire-hypervisor
  install -Dm755 ${srcdir}/skywire-visor ${pkgdir}/usr/bin/skywire-visor
  install -Dm755 ${srcdir}/skywire-cli ${pkgdir}/usr/bin/skywire-cli
  install -Dm755 ${srcdir}/apps/skychat ${pkgdir}/usr/bin/apps/skychat
  install -Dm755 ${srcdir}/apps/skysocks ${pkgdir}/usr/bin/apps/skysocks
  install -Dm755 ${srcdir}/apps/skysocks-client ${pkgdir}/usr/bin/apps/skysocks-client
#  install -Dm755 ${srcdir}/skybian/static/skywire-startup ${pkgdir}/usr/bin/apps/skywire-startup
#  install -Dm755 ${srcdir}/${pkgname}-scripts/skywire-setuser.sh ${pkgdir}/usr/bin/skywire-setuser
#  install -Dm755 ${srcdir}/${pkgname}-scripts/skywire-config.sh ${pkgdir}/usr/bin/skywire-config
#  install -Dm755 ${srcdir}/${pkgname}-scripts/hypervisor-config.sh ${pkgdir}/usr/bin/hypervisor-config
#  install -Dm755 ${srcdir}/${pkgname}-scripts/skywire-user-config.sh ${pkgdir}/usr/bin/skywire-user-config

#install hypervisorconfig PKGBUILD
#  install -Dm644  ${srcdir}/hypervisorconfigPKGBUILD  ${pkgdir}/usr/lib/${projectname}/${pkgname}/hypervisorconfig/PKGBUILD
  #install the system.d services
#	install -Dm644 ${srcdir}/skybian/static/skywire-startup.service ${pkgdir}/usr/lib/systemd/system/skywire-startup.service
}
