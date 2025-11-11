# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appName=EFIBootEditor
_pkgauthor=Neverous
_pkgname=efibooteditor
pkgname=${_pkgname}-bin
pkgver=1.5.4
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
            'e46766a93708412ae6f11c6f2775c33c75dc8264b8c4815bb3c424560de3dba2')
sha256sums_x86_64=('d00550fd8e0e744ebcaee1c3b7f58b5fe96d3463723f5aa50fffb8ad95110ab9')


package() {
	cd "${pkgdir}"

	# this extracts all into the pkgdir
	tar -xf "${srcdir}/data.tar.gz"

	install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "${srcdir}/README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
