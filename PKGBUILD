# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=('lua51-gifine-git')
pkgbase='lua-gifine-git'
pkgdesc='Quickly record and edit gifs and videos of your desktop'
pkgver=dev
_rockrel=1
pkgrel=4
arch=('x86_64')
url='https://github.com/leafo/gifine'
license=('MIT')
depends=('ffmpeg' 'graphicsmagick' 'gifsicle' 'slop' 'lua51-lgi')
makedepends=('luarocks')
provides=('gifine')
source=("git+${url}")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}"/gifine
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "${srcdir}"/gifine
	luarocks --lua-version=5.1 --tree="${pkgdir}/usr/" make --deps-mode=none --no-manifest "gifine-dev-${_rockrel}.rockspec"
	sed -i "s@${pkgdir}@@" "${pkgdir}/usr/bin/gifine"
	install -Dm 644 "hi.png" "${pkgdir}/usr/share/pixmaps/gifine.png"
	install -Dm 644 "../../gifine.desktop" "${pkgdir}/usr/share/applications/gifine.desktop"
}
# vim:set ts=2 sw=2 et: