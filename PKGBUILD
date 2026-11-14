# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=dividebysandwich
_gitname=rat-commander
_appname=rc
_aliasname=${_appname}edit
pkgname=${_gitname}-bin
pkgdesc="A self-contained 2-panel terminal file manager with modern amenities like truecolor support and many built-in system tools for viewing images, managing disks, networks and synchronizing and editing files"

pkgver=1.9.10
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-gnu' 'aarch64-unknown-linux-gnu')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('GPL-2.0')

provides=("${_appname}" "${_aliasname}")
conflicts=("${pkgname%-bin}")

depends=('glibc' 'libgcc' 'libstdc++' 'alsa-lib' 'xz')

options=('!strip')

source=("LICENSE-${pkgver}::${_ghurlraw}/LICENSE"
		"${_appname}-${pkgver}.sh::${_ghurlraw}/packaging/shell/${_appname}.sh")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${pkgver}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${pkgver}-${_barch[1]}.tar.gz")
sha256sums=('8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643'
            '414031b5f9e01892b2ceb58fae68b9670966f50ae0ee66c330258cb608cd1280')
sha256sums_x86_64=('2cad2ef46c4f2331ae1d051d51f8e1ba15b4785ec93d03fa438355abfd113d4c')
sha256sums_aarch64=('13d86ff5d4ccc0e3bd5adf56646e5d2a493088072b9c3a6ac25c23b090d7ccbf')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"
	ln -sf "/usr/bin/${_appname}" "${pkgdir}/usr/bin/${_aliasname}"

	install -Dm644 "${_appname}-${pkgver}.sh" "${pkgdir}/usr/share/${pkgname%-bin}/${_appname}.sh"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
