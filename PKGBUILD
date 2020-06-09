pkgname=haskell-pandoc-citeproc-bin
_pkgname=pandoc-citeproc
pkgver=0.17
_pandoc_ver=2.9.2.1
pkgrel=1
pkgdesc="Supports using pandoc with citeproc - executable only"
url="https://hackage.haskell.org/package/${_pkgname}"
license=("BSD")
arch=("x86_64")
conflicts=("pandoc-citeproc")
provides=("pandoc-citeproc")
replaces=("pandoc-citeproc-bin" "pandoc-citeproc-static" "pandoc-citeproc-lite")
depends=("pandoc")

source=(
    "pandoc-${_pandoc_ver}.tar.gz::https://github.com/jgm/pandoc/releases/download/${_pandoc_ver}/pandoc-${_pandoc_ver}-linux-amd64.tar.gz"
    "${_pkgname}-${pkgver}.tar.gz::https://github.com/jgm/${_pkgname}/archive/${pkgver}.tar.gz"
)
sha256sums=('5b61a981bd2b7d48c1b4ba5788f1386631f97e2b46d0d1f1a08787091b4b0cf8'
            '7d5f736afeb7f4efa626e18cce0b2cbf8f52e6b367295a959bcdb7c5c37f1126')

package() {
    cd "${srcdir}/pandoc-${_pandoc_ver}"
    mkdir -p "${pkgdir}/usr"

    # the original pandoc executable is provided by a different package.
    rm bin/pandoc
    rm share/man/man1/pandoc.1.gz

    cp -r bin share "${pkgdir}/usr"

    # the source tarball provides the right license, changelog, readme and
    # locales
    cd "${srcdir}/${_pkgname}-${pkgver}"

    mkdir -p "${pkgdir}/usr/share/licenses/${_pkgname}"
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}"

    mkdir -p "${pkgdir}/usr/share/${_pkgname}"
    install -Dm 644 changelog README.md "${pkgdir}/usr/share/${_pkgname}/"
    cp -r locales "${pkgdir}/usr/share/${_pkgname}/"
}
