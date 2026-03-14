# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=merlinfuchs
_gitname=vaultbin
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A blazingly fast and secure Pastebin alternative"

pkgver=0.2.1
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'i686' 'aarch64')
_barch=('linux_amd64' 'linux_386' 'linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

backup=("etc/${_appname}/${_appname}.toml")

install="${pkgname}.install"

options=('!strip')

source=("${_appname}.service" "${_appname}.toml" "${_appname}.sysusers" "${_appname}.tmpfiles" "${pkgname}.install")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[0]}.tar.gz")
source_i686=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[1]}.tar.gz")
source_aarch64=("${_appname}-${arch[2]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[2]}.tar.gz")
b2sums=('672b6c19b3b3b63a74c29412c624fd5ac4d8a76d8bef868a75be56cdca061ac08405dcb295f556cdab463590f7b6ca0797a5f81bcd2d93410c06897493b6ba0b'
        '64e9cdc0e4e95ab2eac0deb0c305ce4eca5323e44ad3370c1ddd1dbe6a4ea5c6bcc41c7f3ca6f93fb4095b989f97f091905bec2cd6634c94714e78b3669b73d9'
        '4c4b1bb7b6e2ff32896352e6d64195e69a569df7417a7112d007407a215c17436f286a3138d77c39a1ef62c028c2b4707f71519c77964f4e57fb4840fc1aa8aa'
        '12cf7c5dcd5afd25490b4af72183bc9f1dfd652e58ecd1cbe1ba9e0ce3e5cdadd1b13f6b77983b25796863252bca84b84ae55b40be4670fc72cc635a07f60dc7'
        'f53ff4215b38d06ce585f36446fcdd951ad12dabd3a480ef724a6174c1741b526ea652c5f91345b9f7dd861c42722b05661092575cbddaafe4199cbe2bda9d1f')
b2sums_x86_64=('445454b368d3523c40b4ebc86200f8489cbb3294f84894a72c76ed62d5a131dcc223f17076f619966fb061b9b77baa17b61b36e5d3dfd3a5070b0779800ab9be')
b2sums_i686=('87015ca9241a217dcb05d3d82a7abc85bd9c00056ff78563cee4e799a296495de169c1762a7e30bb7833c12df5994fe998fc9b713835492a1baa9eff49a8c705')
b2sums_aarch64=('663a0882345c9a38853ddac5e62ae334de8106ac02aa97d314cafbe3c1e06e89bc9d02d0e6cce7bf375f5629ab0c8de1638227874fa8764f7fab2d604b529b59')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" -t "${pkgdir}/usr/bin/"

	install -Dm644 "${_appname}.toml" -t "${pkgdir}/etc/${_appname}/"

	install -Dm644 "${_appname}.service" -t "${pkgdir}/usr/lib/systemd/system/"

	install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"
	install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"

	install -Dm644 "${_appname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_appname}.conf"
	install -Dm644 "${_appname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_appname}.conf"
}
