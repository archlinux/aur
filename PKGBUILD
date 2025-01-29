# Maintainer: George Raven <GeorgeRavenCommunity PLUS rapid7-insight-agentbin AT pm DOT me>

_name=rapid7-insight-agent
pkgname=${_name}-bin
pkgdesc="rapid7-insight-agent binary"
pkgver=4.0.8.28
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://www.rapid7.com/"
license=('custom')
depends=()
makedepends=('binutils' 'tar')
conflicts=(${_name})
provides=(${_name})
source=()
b2sums=('87289b839d5e822823ad36b09c19791c188556edcb1fc3ee95e0815cd50f5d0b26f4f7a38de7b0e7add2cff952f940b3fda009e3707d095ab2efe47a3ceecbfb')

# if CARCH is not set default to x86_64
# https://stackoverflow.com/a/11362364/11164973
: "${CARCH:=x86_64}"

case "$CARCH" in
  x86_64) _pkgarch="amd64"
    ;;
  arm*) _pkgarch="arm"
    ;;
  aarch64) _pkgarch="arm64"
    ;;
esac

_file="${_name}_${pkgver}-1_${_pkgarch}.deb"

# The deb file should be self-sourced as it can't be distributed
# it should look something like: rapid7-insight-agent_4.0.8.28-1_amd64.deb
# https://docs.rapid7.com/insight-agent/linux-installation/
source+=("${_file}")


# unpack deb file and data.tar.gz to extract opt/rapid7
prepare() {
	cd "${srcdir}"
	tar -zxf data.tar.gz .
}

# copy opt/rapid7 to pkgdir/opt/rapid7 which will become /opt/rapid7
package() {
	cd "${srcdir}"
	mkdir -p ${pkgdir}/opt
	cp -r ${srcdir}/opt/rapid7 ${pkgdir}/opt/.
}
