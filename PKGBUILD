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
sha256sums=('24ae13d504dc8b7272b69fc01deb43099c2c05aef79cd25a62648665660c7486'
            '5e56fd2ee1cf723ef61e997c2e2152d9070c274e3fce2266f843d1aaf3176389'
            'e1a4a20c34b3642cef77586195491b317e46a5452b9bbe7bc478f4da983812ce')

_platform='64bit'

if [ "$CARCH" = 'i686' ]; then
	_platform='32bit'
	sha256sums[0]='410b10c6a6f517ef23c39e7138c40556176b4bd6724cd73d1fdbe02fcc059fd9'
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

