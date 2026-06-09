# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=Trystan-SA
_gitname=rproc
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A Linux resource & process monitor inspired by Windows 11's Task Manager"

pkgver=0.3.5
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('amd64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'libgcc' 'hicolor-icon-theme')

options=(!strip)

source=("LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.deb::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}-1_${_barch[0]}.deb")
sha256sums=('87f838dd4476de000fa0b1b216e4a6323e1cad587eab2a8066161aa1669cda40')
sha256sums_x86_64=('3d6ae8282e82dc7633ef9203b16e0f3f4fc87dcd6fb7f498b96a7f93091f65ef')


package() {
	cd "${pkgdir}"

	# this extracts all into the pkgdir
	tar -xf "${srcdir}/data.tar.xz"

	mv "${pkgdir}/usr/share/doc/${_appname}" "${pkgdir}/usr/share/doc/${pkgname}"

	install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
