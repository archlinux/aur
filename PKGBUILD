# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=termilly
_gitname=termilly
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A terminal that keeps your agents, servers and projects in view"

pkgver=1.4.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('amd64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('Apache-2.0')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

depends=('glibc' 'libgcc' 'libstdc++' 'glib2' 'gtk3' 'bash' 'libnotify' 'webkit2gtk-4.1' 'hicolor-icon-theme')

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.deb::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[0]}.deb")
sha256sums=('a2d4fc31e35605ad647e8991bdf7b5b786b05b9367fe17a0d03a88504b457087'
            'cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30')
sha256sums_x86_64=('2d78771bfb9e5dfd18ebc3aa3e38e7c75d0bda92dc7d867ff5a3c8a4e92fc80d')


package() {
	cd "${pkgdir}"

	tar -xf "${srcdir}/data.tar.zst"

	rm -rf "${pkgdir}/usr/share/doc/${_appname}"

	install -Dm644 "${srcdir}/README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
