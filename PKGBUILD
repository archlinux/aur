# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_name=LaReview
_gitauthor=puemos
_gitname=lareview
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="The code review workbench"

pkgver=0.1.7
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('amd64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('Apache-2.0' 'MIT')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'libgcc' 'glib2' 'gtk3' 'gdk-pixbuf2' 'cairo' 'libsoup3' 'webkit2gtk-4.1' 'hicolor-icon-theme')

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md" "LICENSE-MIT" "LICENSE-APACHE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.deb::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[0]}.deb")
sha256sums=('c155e06e5ac3e577b591ededc61de465b1e84a57275655528395e69b9266ab55'
            'f07118dec05cd4d1b23459e754d7b8ccd948d3ef851aa558ddb46154a67594cd'
            'c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('83ade45c21b814ce7fa64ff02bf91ba7f292e2ec15249a73cc81d651ace37de7')


package() {
	cd "${pkgdir}"

	# this extracts all into the pkgdir
	tar -xf "${srcdir}/data.tar.gz"

	sed -i -e 's/Categories=/Categories=Development;Utility;/g' "${pkgdir}/usr/share/applications/${_name}.desktop"

	install -Dm644 "${srcdir}/README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "${srcdir}/LICENSE-APACHE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
	install -Dm644 "${srcdir}/LICENSE-MIT" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
