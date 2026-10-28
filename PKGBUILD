# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=excelano
_gitname=xfiles
_appname=(xftp xcp xsync xfind xtree)
pkgname=${_gitname}-bin
pkgdesc="Unix-shaped command-line tools for SharePoint document libraries over Microsoft Graph."

pkgver=1.12.1
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
sha256sums_x86_64=('59e00b42a58c73295ac4076a646aa16b656c886b801382ed48f5cee27e2d0ab8'
                   '3ff552a2fd74dad35007cc61d256b3be3253f64d0c20fd293d89631dab69a1f5'
                   'fb52762433074d9b652f4e833dac206761ecf6664724ed77214552800faed2b5'
                   'b759b9231be45ee53e0933c9dbd6d2fa310ec242e1482dc15c45d0620ed7c508'
                   '7ee72a7514500e749f13837092f579e7d6769fd648722c3835642b7c709c4803')
sha256sums_aarch64=('66e0f4b8c187633d56b423409fadc35be4d04a13ea26c387833f1288363d9136'
                    '08f3ee52c9b05867a5274fc61b569d225a220c2ab6a4714f6df220ebf6a96ea3'
                    '026661257068660c8421fcf2a1c868583d92060e40c69eac241620687ff0d1e9'
                    'c2c3d78d21a9a462b5839fcb4b8dcef7096ce070e5f2764cfaf77f74ddfe4641'
                    '810cbca2b0d3def3e039f556702019493e5474acc4e3c8bd97d7819611bc6416')


package() {
	cd "${srcdir}/" || exit

	for app in "${_appname[@]}"; do
		install -Dm755 "${app}" "${pkgdir}/usr/bin/${app}"
	done

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
