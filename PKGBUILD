# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=excelano
_gitname=xfiles
_appname=(xftp xcp xsync xfind xtree)
pkgname=${_gitname}-bin
pkgdesc="Unix-shaped command-line tools for SharePoint document libraries over Microsoft Graph."

pkgver=1.10.1
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname[@]}")
conflicts=("${pkgname%-bin}")

options=('!strip')

for app in "${_appname[@]}"; do
	source_x86_64+=("${app}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${app}_${pkgver}_${_barch[0]}.tar.gz")
	source_aarch64+=("${app}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${app}_${pkgver}_${_barch[1]}.tar.gz")
done
sha256sums_x86_64=('6a90a0ca629fa0da8b4bff7bf32c6588f0cc8cceb46d1843088614bcd5f08a61'
                   '1fdb2b62351e51f32554c124b94dc0102fec60647b7db82fec6b875acc34402e'
                   'a2883e4201b152e74188cc6bde8e5cdb74aa3dbc8fb1d5ea714324ae08a871d9'
                   'c1e422dfdc3a0a81ac0ca17c5c48c1d92a56898035f7ce863548a613601f660d'
                   '22e6c785c57d89869aa6d9e5e09b22d62cbf608336a72df03e6c5d3016a0e373')
sha256sums_aarch64=('2b54a12721d45ec39e13fef4aea5335c1be8f70b9d1613113055f9fe5867749f'
                    '902356ab2b960bae4f1a7afe905f847114e8ffe9d8cae2b5a253d09eb8f455ab'
                    'e9f2efeefde02ec3b9f74190ee31e81b7b45e7388d3ebfa02aac2e82db145ea6'
                    '4cc526129f9d9c305c4aa2ad740de2c3b97a46e11d9168a1e28988ad02406d98'
                    '6d4135faddbcea371f78c1bdd8d95830b47451ce57858bed7fa556226e57fdef')


package() {
	cd "${srcdir}/" || exit

	for app in "${_appname[@]}"; do
		install -Dm755 "${app}" "${pkgdir}/usr/bin/${app}"
	done

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
