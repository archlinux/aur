# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=excelano
_gitname=xfiles
_appname=(xftp xcp xsync xfind xtree)
pkgname=${_gitname}-bin
pkgdesc="Unix-shaped command-line tools for SharePoint document libraries over Microsoft Graph."

pkgver=1.11.1
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
sha256sums_x86_64=('5eb07361a2659a88a5431524514a28edfa4f96c2ee4378cacfc2d78e0036f1a0'
                   'aaad34367ddabaef8b42a5e025d7dba860aca87f1a7b285c905655f055f24f85'
                   '51204b460de577e8baea324061d72330e42b12124c10868b4016901b48b99c4d'
                   '46700a51acb5322f69521287faf900cc301bea9cf7bea183f29173375b3f6c6f'
                   '7567e515a7099d464f01391bedc83205ccfad1f1b397469264aaa4bce5cef00c')
sha256sums_aarch64=('ce32a7dda2d45e652360bfcb9840aec9d95cc5447e4621bc34807881b57a6224'
                    'cfbbd85de9ee91d4d60470299043e660e7c69df875b4403f658c4715c2f83a2c'
                    '653a20ad1378d04a4d3dbf0c90777ee24948ae505a93e4043d72907ebfec5840'
                    '1a98bebec90a05b32ea65060501c29f14ff4c42086a50e2ab22709d2edbfd2e7'
                    '570101f1864424195c82fabdbc85e43f1c99d7627a308ce57af455587ccd2d0a')


package() {
	cd "${srcdir}/" || exit

	for app in "${_appname[@]}"; do
		install -Dm755 "${app}" "${pkgdir}/usr/bin/${app}"
	done

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
