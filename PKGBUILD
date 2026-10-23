# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=excelano
_gitname=xfiles
_appname=(xftp xcp xsync xfind xtree)
pkgname=${_gitname}-bin
pkgdesc="Unix-shaped command-line tools for SharePoint document libraries over Microsoft Graph."

pkgver=1.11.0
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
sha256sums_x86_64=('3f37a49187fa1ddad9cf050feabd6ffcc7a6d07331a4a47f6d22307833413512'
                   '168db9518a682d538f44a3a0895392bb9dbb0aca0fb2b4824f705a0fa6535a41'
                   '3bde1453c3d8715d08043eb3339d8a6d4dfc6ee2d28c0aafd42831d001f2c9f2'
                   '3f4a883728da187bbbc2412412bfeb7700f6ac0977920ff9d546d4ae881aa91e'
                   '22bbce71aef869dcaf92a8a4839aa0db83397f632270b057d3e2f9b336613552')
sha256sums_aarch64=('35ee6992fc4a1c34825670248af7cf8fec848047669ea24b47ce232b131b9a20'
                    '4f6750871f311ae87c55232ee042031c10e77a959925197da684daefc02fd2a2'
                    'bab479f37486e987ee88fb2f5f082e8879f861abe4ba336f4a5b40f4a1b97113'
                    'cea4fd3becebf9cb9a93e18e8da2ab160ad0c15077bcb3e77ffedc17f50c4e4f'
                    'daac7d70d161ce0ca991cf23ddb9c02abd3009e7fb3ec7122dbb6ba99fc05cff')


package() {
	cd "${srcdir}/" || exit

	for app in "${_appname[@]}"; do
		install -Dm755 "${app}" "${pkgdir}/usr/bin/${app}"
	done

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
