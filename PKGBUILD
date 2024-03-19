# Maintainer: keutain <quentin at aniere at gmail dot com>

pkgname=utc-latex-report
_latexpkgname=utc-report
pkgver=1.1.1
pkgrel=1
pkgdesc="UTC LaTeX report template"
url="https://github.com/qaniere/utc-latex"
arch=("any")
license=("BSD2")
depends=("texlive-basic")
source=("$pkgname-$pkgver.tar.gz::https://github.com/qaniere/utc-latex/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('c3ec05d9128b8a8162b4d7534f2f7f8688b8698dbe875a1b14b309088c1ab43f')

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

