# Maintainer: grufo <madmurphy333@gmail.com>

pkgname='popcorntime-ce-bin'
_pkgname='popcorntime-ce'
pkgver='0.4.0'
pkgrel='2'
pkgdesc='Stream movies from torrents. Skip the downloads. Launch, click, watch. Repos of the original community edition.'
arch=('x86_64' 'i686')
url='http://www.popcorn-time.is/'
license=('GPL3')
depends=('alsa-lib' 'desktop-file-utils' 'gconf' 'gtk2' 'libnotify' 'libxtst' 'nodejs' 'nss' 'python' 'ttf-font')
optdepends=('net-tools: necessary for the new vpn feature' 'ttf-liberation: open source ttf fonts')
provides=('popcorntime' 'popcorntime-ce')
conflicts=('popcorntime-ce' 'popcorntime-ce-git')
options=('!strip')
install='popcorntime-ce.install'
md5sums=('21693efbd20f41198b8ebb80e5e81588'
         'b8996810c9862bd9b41880b82055073f'
         '53367e600bad6229b200ed4478f8fcbb')

_platform='64bit'

if [ "$CARCH" = 'i686' ]; then
	_platform='32bit'
	sha1sums[0]='369da992f097e1b872a0f7d00a62361ac9192c93'
fi

source=("https://github.com/PopcornTimeCommunity/desktop/releases/download/v${pkgver}-${pkgrel}/popcorn-time-community-v${pkgver}-${pkgrel}-${_platform}.tar.xz"
	'popcorntime-ce.install'
	'popcorntime-ce.desktop')


package() {

	cd "${srcdir}"

	install -dm755 "${pkgdir}/usr/share/${_pkgname}"
	install -dm755 "${pkgdir}/usr/bin"

	# Program
	install -Dm755 "${srcdir}/Popcorn-Time" "${pkgdir}/usr/share/${_pkgname}/Popcorn-Time-CE"
	install -Dm644 "${srcdir}/"{CHANGELOG.md,icudtl.dat,libffmpegsumo.so,LICENSE.txt,nw.pak,package.json,README.md} "${pkgdir}/usr/share/${_pkgname}/"

	# Directories
	cp -a "${srcdir}/"{node_modules,src} "${pkgdir}/usr/share/${_pkgname}/"

	# Link to program
	ln -s "/usr/share/${_pkgname}/Popcorn-Time-CE" "${pkgdir}/usr/bin/${_pkgname}"

	# Desktop file
	install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

	# Icon
	install -Dm644 "${srcdir}/src/app/images/icon.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"

}

