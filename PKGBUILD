# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_packagename=AngKorGit
_gitauthor=cheat2001
_gitname=angkorgit
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A modern, fast, beautiful open-source Git client"

pkgver=0.20.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('amd64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url="https://angkorgit.app/"

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")
depends=('git' 'glibc' 'libgcc' 'glib2' 'cairo' 'libsoup3' 'zlib' 'gtk3' 'gdk-pixbuf2' 'dbus' 'webkit2gtk-4.1' 'hicolor-icon-theme')

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.deb::${_ghurl}/releases/download/${_gitversion}/${_packagename}_${pkgver}_${_barch[0]}.deb")
sha256sums=('c9faf655b844c1805085d97424f23602fe6547dd6dfc0f35b796ad1808a6a27a'
            'e2e20cd37ca31853f05df3cfdc3053208ead8f26279cea442fb6930bd4cc59fe')
sha256sums_x86_64=('46572d86e34471cf1d801a4494adabb7313c1a3848fdb9e07807eb00e03db8f8')


package() {
	cd "${pkgdir}/" || exit

	tar -xf "${srcdir}/data.tar.gz"

	install -Dm644 "${srcdir}/README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
