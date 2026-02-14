# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=unhappychoice
_pkgname=steamfetch
_appname=${_pkgname}
pkgname=${_pkgname}-bin
pkgdesc="neofetch for Steam - Display your Steam stats in terminal"

pkgver=0.5.2
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64')
_barch=('x86_64-unknown-linux-gnu')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('ISC')

provides=("${_appname}")
conflicts=("${_pkgname}")
depends=('glibc' 'libgcc' 'openssl')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-${_barch[0]}.tar.gz")
sha256sums=('6cb601bf02e765d2ebed2dd123913c684ebb257244193dfa2084a6f2835a5aa5'
            'cdd613d4ce9408cc32027e061c26e771280bf1d5b1f4162da5c393d657451db7')
sha256sums_x86_64=('d9ca4080f136dd4ce192222699513c8ce00c8c2990c282c7fb32a63f62ae6771')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm755 "libsteam_api.so" "${pkgdir}/usr/lib/libsteam_api.so"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
