# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=GlitchAwakened
_gitname=Favnyr
_appname=${_gitname,,}
pkgname=${_appname}-bin
pkgdesc="A modern and lightweight file manager for Windows and Linux"

pkgver=0.3.4
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('linux-x86_64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('GPL-3.0')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

depends=('glibc' 'libgcc' 'fontconfig' 'hicolor-icon-theme')

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.tar.gz")
sha256sums=('5485d9e9ff26e4bb950df0a3c646b8f444dc35260b7f6ae5ed2ed9b8cc61468b'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_x86_64=('7edd0c90ce03cf532af9bad7d920876a0b008884ae608b85d2fdaeee50217e49')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "${_appname}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_appname}.svg"

	install -Dm755 /dev/stdin "${pkgdir}/usr/share/applications/${_appname}.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=${_appname^}
Comment=${pkgdesc}
Exec=/usr/bin/${_appname} %U
Icon=${_appname}
Terminal=false
MimeType=inode/directory
Categories=System;FileManager;FileTools
Keywords=File;Manager;Explorer;Browser;Launcher
StartupWMClass=${_appname}
EOF

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
