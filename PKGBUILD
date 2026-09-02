# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=yetidevworks
_gitname=drydock
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A live TUI dashboard for a fleet of git repos"

pkgver=1.1.1
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x86_64' 'linux-aarch64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'libgcc' 'git')

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}.tar.gz")
sha256sums=('07a46aa737a39224a83acae92a40616ae6abeb6d211835ee868c43953361826c'
            'c13c90e64ceabc5dfe6450da43bb2479cd026feed99338bff3391677c65e1c6a')
sha256sums_x86_64=('f25195204627e7946dbb19d68761f4e9433ba19dbbe7b1cf8ca233a05207b742')
sha256sums_aarch64=('d38ad0367da13eb0e108909bc378f5c5ae3fa8c3ebd355666b8c6741a0a938fc')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
