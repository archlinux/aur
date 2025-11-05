# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=Martchus
_pkgname=tageditor
pkgname=${_pkgname}-bin
pkgver=3.9.8
_pkgvername=v${pkgver}
pkgrel=1
pkgdesc="A tag editor with Qt GUI and command-line interface supporting MP4/M4A/AAC (iTunes), ID3, Vorbis, Opus, FLAC and Matroska"
arch=('x86_64')
_barch=('x86_64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('GPL-2.0-or-later')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('libglvnd' 'hicolor-icon-theme' 'libx11' 'glibc')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md"
        "ICON-${pkgver}.svg::${_urlraw}/resources/icons/hicolor/scalable/apps/tageditor.svg")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgname}-${pkgver}-${_barch[0]}-pc-linux-gnu.tar.xz")
sha256sums=('c03cea027b4b40e4402fabd08557736727ec3d5bc54ad64ab6472de432198cad'
            '52cb9b25f1280db821c3042e4815c8850930e7ca25aa4744e77f106641888bad'
            'd12704a39f79dcaaf7f14ac158542b2e5e2d37ec53a4cbd5d5a5f292a8e4228e')
sha256sums_x86_64=('25920a9663218ef924559d89802a503e3122707517727c9f6a974072a5d13b42')


prepare() {
	echo """[Desktop Entry]
Name=Tag Editor
GenericName=Tag Editor
Comment=A tageditor with Qt GUI and command line interface. Supports MP4 (iTunes), ID3, Vorbis, Opus, FLAC and Matroska
Exec=tageditor
Icon=tageditor
Terminal=false
Type=Application
Categories=AudioVideo;Database""" > tageditor.desktop

	echo """[Desktop Entry]
Name=Renaming Utility (Tag Editor)
GenericName=Renaming Utility (Tag Editor)
Comment=Tool to rename files using its tag information
Exec=tageditor qt-gui --renaming-utility
Icon=tageditor
Terminal=false
Type=Application
Categories=AudioVideo;Database""" > tageditor-renamingutility.desktop
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "ICON-${pkgver}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg"

	for app in *.desktop; do
		install -Dm644 "${app}" "${pkgdir}/usr/share/applications/${app}"
	done

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
