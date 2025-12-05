# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appName=EFIBootEditor
_pkgauthor=Neverous
_pkgname=efibooteditor
pkgname=${_pkgname}-bin
pkgver=1.5.5
_qtversion=6.8.3
_ubuntuversion=24.04
_compiler=CLang
pkgrel=1
pkgdesc="Boot Editor for (U)EFI based systems."
arch=('x86_64' 'aarch64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('LGPL-3-0')

provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-qt5")
depends=('glibc' 'libglvnd' 'gcc-libs' 'efivar' 'qt6-base' 'zlib')
makedepends=('tar')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE.txt"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_appName}-v${pkgver}-ubuntu-${_ubuntuversion}-qt-${_qtversion}-${_compiler}.deb")
sha256sums=('e3a994d82e644b03a792a930f574002658412f62407f5fee083f2555c5f23118'
            'dc75ee36430c142cd4f7eaccacfcf44a2d12acabf54d23ef139bee45c21906d1')
sha256sums_x86_64=('63c6f63a646e87214b01dfeee472eaa2724c565854bf8df5914177064961d645')


package() {
	cd "${pkgdir}"

	# this extracts all into the pkgdir
	tar -xf "${srcdir}/data.tar.gz"

	install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "${srcdir}/README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
