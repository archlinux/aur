# Maintainer: keutain

pkgname=utc-latex-report
latexpkgname=utc-report
pkgver=1.0.0
pkgrel=1
pkgdesc="UTC LaTeX Report theme"
url="https://github.com/qaniere/utc-latex"
arch=("any")
license=("BSD2")
depends=("texlive-basic")
source=("$pkgname-$pkgver.tar.gz::https://github.com/qaniere/utc-latex/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('301caddeb14d382d7568fb789bcb1e34edec6c520d63fdfba33552b37632c556')

package() {
    # Get the proper installation path
    TEXMFDIST=$(kpsewhich -var-value=TEXMFDIST)

    # Install the files to the correct path
    mkdir -p "${pkgdir}/${TEXMFDIST}/tex/latex/${latexpkgname}"
    cp -r "${srcdir}/utc-latex-${pkgver}/${latexpkgname}" "${pkgdir}/${TEXMFDIST}/tex/latex/"

    # Fix folder permissions (TODO: Figure out why ?)
    chmod -R 755 "${pkgdir}/${TEXMFDIST}/tex/latex/${latexpkgname}"

    # Install the license
    install -Dm644 "${srcdir}/utc-latex-${pkgver}/licenses/${latexpkgname}.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}/${latexpkgname}.txt"
}

