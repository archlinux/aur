# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=excelano
_gitname=xfiles
_appname=(xftp xcp xsync xfind xtree)
pkgname=${_gitname}-bin
pkgdesc="Unix-shaped command-line tools for SharePoint document libraries over Microsoft Graph."

pkgver=1.12.0
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
sha256sums_x86_64=('b95c7d750e9e89b5c22e4b90892f1498f7bafc2d796f11fedad435d65115573b'
                   '2ae961b843bc90f5ce7befae25b70ce445357fd433296e7000b04ee3550b69be'
                   '9b34dba323eb771ae4eda73b5d5a3670809a9248b3f9c49a2e063c18d8e87aa3'
                   '36fa4b890c46f01f81615926cf4c02c8e6f64832f6f88b2d40268ce7b3d1c3f1'
                   '10be4fc52d74424101a4c627200449b04ce998bac21e1b91f9da04e6f31fc070')
sha256sums_aarch64=('9e3802a3d04dcefaac2e3c49b40d44cb09b0903da86ad7c256e9310220cd71c3'
                    'd69f5acda6e0cd6a362399d4e5ff991f8318598fa389f3f4272260677a96cf76'
                    '219b96d554efea5bb9df92c9868836a3c191480e5dfde479184e26b91239838a'
                    '581491f706465e13a74384d4bc6e76eb879ca0942919190dd26df4feebe7fcf2'
                    'ade71bb1e8d53d76211a9c52339b0c949d4c824d48daf683e3b16211cf5da328')


package() {
	cd "${srcdir}/" || exit

	for app in "${_appname[@]}"; do
		install -Dm755 "${app}" "${pkgdir}/usr/bin/${app}"
	done

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
