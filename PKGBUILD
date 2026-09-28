# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=excelano
_gitname=xfiles
_appname=(xftp xcp xsync xfind xtree)
pkgname=${_gitname}-bin
pkgdesc="Unix-shaped command-line tools for SharePoint document libraries over Microsoft Graph."

pkgver=1.10.2
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
sha256sums_x86_64=('31ba89d4f67b04b66ea572fd27de0211e8c70957aeca4124b1f85d4f599d59ec'
                   '5b912d5839aa5fd90069d81a35df24d36de1eb1b1f02aff1db82ad524dad793c'
                   'de209abf62dfe5ba50138e3f9aa308dc2dea2532b4941a1a086adbe162162fc3'
                   'e5f91daee5f6ed35923cba0dbb2f7ecf3335f2f56b7caabe9eaae6065ff2d4cf'
                   '536008a58a461ee919e49a9562cb535870b8ce1ca609860eeac710d2a23999d2')
sha256sums_aarch64=('6f6931802ca6f6a5d0cd72ebedeaefc08beffc450c569cbab611a96354f9838f'
                    '59b8b7af04e2530de0266f34aa541e41fef726e773fa3ebc84628cdfa37b2222'
                    '00dc0c07c5bd58136c160d8d8136e1ccf67267741ba4b40bf691f7097cfd07a9'
                    'a48830a3edd19a1683cbf794dbbeaa94998a1e7a310fed7222001a4b7f23bd16'
                    '7f025f907ed6a24f136d0baa61796d97e39b10123ce29b82501b579d9bcdf0d7')


package() {
	cd "${srcdir}/" || exit

	for app in "${_appname[@]}"; do
		install -Dm755 "${app}" "${pkgdir}/usr/bin/${app}"
	done

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
