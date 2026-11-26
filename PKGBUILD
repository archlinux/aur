# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=Razee4315
_gitname=Paperling
_appname=${_gitname,,}
pkgname=${_appname}-bin
pkgdesc="A minimal, distraction-free markdown editor"

pkgver=1.3.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('amd64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('Apache-2.0')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'libgcc' 'glib2' 'gtk3' 'dbus' 'libsoup3' 'cairo' 'gdk-pixbuf2' 'webkit2gtk-4.1' 'hicolor-icon-theme')

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.deb::${_ghurl}/releases/download/${_gitversion}/${_gitname}_${pkgver}_${_barch[0]}.deb")
sha256sums=('6db231a331f98f761dc370ce5d633c67da65f3765b189aff9c54e4ae216ba50e'
            'c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('4d1c909b212e29df255b2961c0441266a0550e2f0fe50c075e467116b78b5dda')


package() {
	cd "${pkgdir}" || exit

	# this extracts all into the pkgdir
	tar -xf "${srcdir}/data.tar.gz"

	_desktop="${pkgdir}/usr/share/applications/${_gitname}.desktop"
	sed -e "s|Comment=A Tauri App|Comment=${pkgdesc}|g" -i "${_desktop}"
	mv "${_desktop}" "${_desktop%/*}/$(basename "${_desktop,,}")"

	install -Dm644 "${srcdir}/README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
