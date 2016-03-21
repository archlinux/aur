# Maintainer: casualjoke

pkgname=porntime
pkgver=0.3.8
pkgrel=1
pkgdesc="Stream porn movies from torrents. Skip the downloads. Launch, click, watch."
arch=('x86_64' 'i686')
url="http://porntime.ws/"
license=('GPL3')
depends=('ttf-liberation' 'gconf' 'nss' 'libxtst' 'gtk2' 'alsa-lib')
optdepends=('net-tools: necessary for the new vpn feature')
provides=('porntime')
options=('!strip')
install="porntime.install"
md5sums=('3f67821d7bfc80bd8bb858bc92f5425b'
	'7b908d594b39d64fc5b7134213634135'
	'eda173affdfd1630ff6a0bfa566bc1de'
	'987c7e4be7f7dc7079200fe11c21a80b')

_platform=X64

if [ "$CARCH" = 'i686' ]; then
	_platform=X32
	md5sums[0]='7dc74d8e04b62925a54c14b29d8b1f3d'
fi

# In case of problems, a snapshot of the version linked to this PKGBUILD is provided
# at https://github.com/porntime/PornTime.2016.03.21.snapshot -- clone it, or just
# use the following sources:
#
# * https://github.com/porntime/PornTime.2016.03.21.snapshot/raw/master/PornTimeX64.tar.gz
# * https://github.com/porntime/PornTime.2016.03.21.snapshot/raw/master/PornTimeX32.tar.gz

source=("http://porntime.ws/PornTime${_platform}.tar.gz"
	"icon.png"
	"porntime.install"
	"porntime.desktop")

package() {

	cd "${srcdir}"

	install -dm755 "${pkgdir}/opt/${pkgname}/"
	install -dm755 "${pkgdir}/usr/bin"
	install -dm755 "${pkgdir}/usr/share"

	# Program
	echo "${pkgdir}/opt/${pkgname}/"
	install -Dm755 ${srcdir}/PornTime		"${pkgdir}/opt/${pkgname}/"
	install -Dm644 ${srcdir}/nw.pak		"${pkgdir}/opt/${pkgname}/"
	install -Dm644 ${srcdir}/libffmpegsumo.so	"${pkgdir}/opt/${pkgname}/"

	# Link to program
	ln -s "/opt/${pkgname}/PornTime" "${pkgdir}/usr/bin/porntime"

	# Desktop file
	install -Dm644 "${srcdir}/porntime.desktop" "${pkgdir}/usr/share/applications/porntime.desktop"

	# Icon
	install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/pixmaps/porntime.png"

}

