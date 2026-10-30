# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=navid-m
_gitname=hexal
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A modal text editor aiming to supersede Helix"

pkgver=0.3.5
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x86_64' 'linux-aarch64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('GPL-3.0')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

depends=('glibc' 'libgcc')

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.zip::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_gitversion}-${_barch[0]}.zip")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.zip::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_gitversion}-${_barch[1]}.zip")
sha256sums=('40a3e11ec20c9b0e661c5be2bf2ca7fc18370e778ac57b2660b2b8a19531f293'
            'ddec419b3e1e15ff0e03b24e51665e2be0a6b8c39cf5071d7e939ddc56370f4f')
sha256sums_x86_64=('b061f98a015e1107a5ded474c25c3790c1762000e42179bb0cf1fb1cfcc02ae0')
sha256sums_aarch64=('4e0b846349725454d0f606e316cad9b91c1374b8c56a1fb0182dc323ac4de42c')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -dm755 "${pkgdir}/usr/share/${_appname}"
	cp -rfa "data" "${pkgdir}/usr/share/${_appname}/"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
