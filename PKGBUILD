# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Gokberk Yaltirakli <aur at gkbrk dot com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

_gitauthor=sgpthomas
_gitname=hourglass
_appname=${_gitname}
pkgname=${_appname}
pkgdesc="Simple clock application that provides stopwatches, alarms, and timers"

pkgver=3.1.3
pkgrel=1
_gitversion=${pkgver}

arch=('x86_64' 'aarch64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('GPL-3.0')

depends=('gtk4' 'dconf' 'libgee' 'granite7' 'libportal' 'libportal-gtk4')
makedepends=('meson' 'ninja' 'vala')
provides=("${_appname}")

options=('!strip')

source=("${pkgname}-${pkgver}.tgz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('9a3b3e4d1729b68e3480c5879ba487fcea2b3d147cba68640c0e38d1224bcbe7')


build () {
	cd "${pkgname}-${pkgver}"

	meson build --prefix="/usr"

	cd build
	ninja
}

package () {
	cd "${pkgname}-${pkgver}"

	cd build
	DESTDIR="${pkgdir}" ninja install
	cd ..

	ln -sf "/usr/bin/com.github.${_gitauthor}.${_gitname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
