# Maintainer: keutain <quentin at aniere at gmail dot com>

pkgname=utc-latex-report
_latexpkgname=utc-report
pkgver=1.1.2
pkgrel=1
pkgdesc="UTC LaTeX report template"
url="https://github.com/qaniere/utc-latex"
arch=("any")
license=("BSD2")
depends=("texlive-basic")
source=("$pkgname-$pkgver.tar.gz::https://github.com/qaniere/utc-latex/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('f8d38ae41bef018e1cc9ff2d6d5c2272b7c57b4abc09d7ea09a237025cf3a674')

package() {
    # Get the proper installation path
    TEXMFDIST=$(kpsewhich -var-value=TEXMFDIST)

    # Install the files to the correct path
    mkdir -p "${pkgdir}/${TEXMFDIST}/tex/latex/${_latexpkgname}"
    cp -r "${srcdir}/utc-latex-${pkgver}/${_latexpkgname}" "${pkgdir}/${TEXMFDIST}/tex/latex/"

    # Fix folder permissions (TODO: Figure out why ?)
    chmod -R 755 "${pkgdir}/${TEXMFDIST}/tex/latex/${_latexpkgname}"

    # Install the license
    mkdir -m 755 -p ${pkgdir}/usr/share/licenses/utc-latex/
    install -m 644 "${srcdir}/utc-latex-${pkgver}/licenses/${_latexpkgname}.txt" -t "${pkgdir}/usr/share/licenses/utc-latex/"
}

