# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=excelano
_gitname=xfiles
_appname=(xftp xcp xsync xfind xtree)
pkgname=${_gitname}-bin
pkgdesc="Unix-shaped command-line tools for SharePoint document libraries over Microsoft Graph."

pkgver=1.10.0
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
sha256sums_x86_64=('4d64520467ad1f72a4ae75b7db9fe53929128c8da640632ac7b17694f4a0d3e2'
                   '797b196a9f8ac9e5ad57b16e03d366cc2884d368a8b7a8cdc081d9aee19c0ea4'
                   '38952cdcec410e33e591ff4b5dae1729458be7e402cce772700d5337e439fa6c'
                   '6f143e6ef081f89facb7762a8ad8696859db17f9f944fdf52d5c54f997419709'
                   'e0ab932b1080bc79b89864dbb6e3acea3be3fbe3fed0b3624640b07a36318241')
sha256sums_aarch64=('ae6199af0a3c4e1eb6b9280e2bef5d56e12dcd62112d094093f6aaac26b44217'
                    '9217addd3ea85d550f16e3c4fcae4178115ac25a802f2046f69b14cd2e6d610d'
                    '547127034499314dc6c7bd2a978f8dc6e4680d993122bd4fb00ce7220aae9cc8'
                    'fc024aba6e6b734e7f5cd7c1caded452f98cb60e650c0501d949f72fc52350a1'
                    'be9a064e312dd8e96c99d48be82b1eadba8cb87b4c098edbaa6e01f95746e90b')


package() {
	cd "${srcdir}/" || exit

	for app in "${_appname[@]}"; do
		install -Dm755 "${app}" "${pkgdir}/usr/bin/${app}"
	done

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
