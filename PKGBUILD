# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
# Maintainer: Rudi [KittyCash] <rudi@skycoinmail.com>
pkgname=skyhwd
_pkgname=hardware-wallet-daemon
_githuborg=skycoin
pkgdesc="HTTP API to interface with the Skycoin hardware wallet. skycoin.com"
pkgver=1.0.0
_pkggopath="github.com/${_githuborg}/${_pkgname}"
pkgrel=1
arch=( 'i686' 'x86_64' 'aarch64' 'armv8' 'armv7' 'armv7l' 'armv7h' 'armv6h' 'armhf' 'armel' 'arm' )
#url="https://${_pkggopath}"
url="https://skycoin.com"
#makedepends=('git' 'go' 'musl' 'kernel-headers-musl') #disable signature check pending fixes#  'skycoin-keyring')
depends=('skycoin')
#source=("git+${url}.git")
#source_=("https://downloads.skycoin.com/skywallet-daemon/skyhwd-1.0.0-linux-x64.tar.bz2")

_binarchive=("skyhwd-${pkgver}-linux")
_release_url=("https://downloads.skycoin.com/skywallet-daemon/${_binarchive}")
source_x86_64=("${_release_url}-x64.tar.bz2")
source_i686=("${_release_url}-x86.tar.bz2")
source_arm=("${_release_url}-arm-7.tar.bz2")
source_aarch64=( ${source_arm[@]} )
source_armv8=( ${source_arm[@]} )
source_armv7=( ${source_arm[@]} )
source_armv7l=( ${source_arm[@]} )
source_armv7h=( ${source_arm[@]} )
sha256sums_x86_64=('70ca900325d77c2b97c963db4b5de79b3e4821c279fc5a0bf367f4c0d11011c6')
sha256sums_i686=('5e8651aea4805e8fdf3ef31df6e63c5d6f3678a3b6c3027b3b91f37c391be3f9')
sha256sums_arm=('26b793143bab233fc2dc3746af9307dca029a1749258cdac47097eb9317e84f2')
sha256sums_aarch64=('26b793143bab233fc2dc3746af9307dca029a1749258cdac47097eb9317e84f2')
sha256sums_armv8=('26b793143bab233fc2dc3746af9307dca029a1749258cdac47097eb9317e84f2')
sha256sums_armv7=('26b793143bab233fc2dc3746af9307dca029a1749258cdac47097eb9317e84f2')
sha256sums_armv7l=('26b793143bab233fc2dc3746af9307dca029a1749258cdac47097eb9317e84f2')
sha256sums_armv7h=('26b793143bab233fc2dc3746af9307dca029a1749258cdac47097eb9317e84f2')

#prepare() {
#	export GOPATH=${srcdir}/go
#	export GOBIN=${GOPATH}/bin
#	export _GOAPPS=${GOPATH}/apps
#	#use musl-gcc for static compilation
#	export CC=musl-gcc
#	# https://wiki.archlinux.org/index.php/Go_package_guidelines
#	mkdir -p ${GOPATH}/src/${_pkggopath//$_pkgname/} ${GOBIN}
#	ln -rTsf ${srcdir}/${_pkgname} ${GOPATH}/src/${_pkggopath}
#}

#	build() {
#	cd ${GOPATH}/src/${_pkggopath}
#	[[ ! -f go.mod ]] && go mod init
#	go mod vendor
#	go mod tidy
#	_msg2 'building daemon binary'
#	cd cmd/daemon
#	go build -trimpath --ldflags="" --ldflags "${BUILDINFO} -s -w -linkmode external -extldflags '-static' -buildid=" -o $GOBIN/ .
#	#binary transparency
#	cd $GOBIN
#	mv daemon
#	msg2 'binary sha256sums'
#	sha256sum $(ls)
#}

package() {
	_pkgdir=${pkgdir}
	_msg2 'installing skyhwd'
	mkdir -p ${_pkgdir}/usr/bin
	install -Dm644 ${srcdir}/lib/udev/rules.d/50-skyhwd.rules ${_pkgdir}/usr/lib/udev/rules.d/50-skyhwd.rules
	install -Dm644 ${srcdir}/usr/lib/systemd/system/skyhwd.service ${_pkgdir}/usr/lib/systemd/system/skyhwd.service
	install -Dm755 ${srcdir}/usr/bin/skyhwd ${_pkgdir}/opt/skycoin/bin/skyhwd
	ln -rTsf ${_pkgdir}/opt/skycoin/bin/skyhwd ${_pkgdir}/usr/bin/skyhwd
}

_msg2() {
(( QUIET )) && return
local mesg=$1; shift
printf "${BLUE}  ->${ALL_OFF}${BOLD} ${mesg}${ALL_OFF}\n" "$@"
}
