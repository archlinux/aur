# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=excelano
_gitname=xfiles
_appname=(xftp xcp xsync xfind xtree)
pkgname=${_gitname}-bin
pkgdesc="Unix-shaped command-line tools for SharePoint document libraries over Microsoft Graph."

pkgver=1.12.2
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
sha256sums_x86_64=('6f671859b729999f2b504e74d4d3c330553549259750579bab1b61671aa3f4cd'
                   '9c02fb302c4b42034e3f1cd772aff7c18c27b59145ffcab5ac7712ab76f34109'
                   'a8029e1e11debcb47dea0594f06592283299a80445010df8d2bf58c8589d362b'
                   'd6d6eda6844ef55b19303d262c9ba4ceb9cdc997be0724f15e9d9ab711b87529'
                   '0393b463c246e9e6b412c986eae6490dd0bda85d232f46f2ed1aa5b26d27e046')
sha256sums_aarch64=('1be3fd1e2e2185d67c15dadf748a1f38dfe371aded00c3f8545bbf51d30c56fe'
                    '95430704cfa9f46ddd1047f69460ae68ddc28be17494ffa40e26e861dafb8b50'
                    '4d7d5fbd39cc100c685f484e9c7d6e5705f6b7a1eaf3720740c2fd735e3a4335'
                    '7880edbdf41aefb5bbbe1cab6b9ee1e9da39130bb4fcd137219708c15e9ca8ff'
                    '562d226d61de38c01efeb66096cb89269d967e974aa5974616fbec2d10023998')


package() {
	cd "${srcdir}/" || exit

	for app in "${_appname[@]}"; do
		install -Dm755 "${app}" "${pkgdir}/usr/bin/${app}"
	done

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
