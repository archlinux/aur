pkgname=haskell-pandoc-citeproc-bin
_pkgname=pandoc-citeproc
pkgver=0.17.0.1
_pandoc_ver=2.10.1
pkgrel=2
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
sha256sums=('a3ab481ad53f5568d7ec5263fbdd3478fb320d13b5d61a92fb5cee410186bd86'
            '13b2fcbfe490521682b7aba1c92c826c89784cea587765057b568fce97b0177d')

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
