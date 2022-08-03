# Maintainer: grufo <madmurphy333 AT gmail DOT com>

_appname='PDFCrop'
pkgname="${_appname,,}"
pkgver='0.4b'
pkgrel=1
pkgdesc='A PDF utility for GNU/Linux that crops the white margins of PDF pages and rescales them to fit a standard size sheet of paper'
arch=('any')
url='http://pdfcrop.sourceforge.net/'
license=('GPL3')
depends=('ghostscript' 'perl')
conflicts=("${pkgname}-git")
source=("https://sourceforge.net/projects/${pkgname}/files/${pkgname}/${_appname}%20v${pkgver}/${pkgname}_v${pkgver}.tar.gz"
        'exec-rename.patch.in')
sha256sums=('090995ebbe02e9ce8868945b506103583c52f42c8946e2e12db8b8c5ed75467d'
            'aa3a3026e32e98775a4f3dc6a8d6cb7cdd66e9178f99ccba92f78aef0f5bd9bb')

# We need to rename the `pdfcrop` executable as long as we want this package to
# be compatible with the `texlive-core` package. Any name will do here.
_execname='pdf-crop'

prepare() {
	cd "${srcdir}/${pkgname}_v${pkgver}"
	sed "s/@APPEXECNAME@/${_execname}/g" "${srcdir}/exec-rename.patch.in" > "${srcdir}/exec-rename.patch"
	patch < "${srcdir}/exec-rename.patch"
}

package() {
	cd "${srcdir}/${pkgname}_v${pkgver}"
	install -dm755 "${pkgdir}/usr/bin"
	install -Dm755 "${srcdir}/${pkgname}_v${pkgver}/${pkgname}" "${pkgdir}/usr/bin/${_execname}"
}

