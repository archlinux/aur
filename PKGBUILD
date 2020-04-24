# Maintainer: Bogdan Burlacu <bogdan.burlacu@pm.me>

pkgname="tsv-utils-bin"
_pkgname=tsv-utils
pkgver=1.6.1
pkgrel=1
pkgdesc="Command line tools for large, tabular data files. Filtering, statistics, sampling, joins and more. Self-contained official binary release package."
arch=('x86_64')
groups=('dlang')
url="https://github.com/eBay/tsv-utils"
license=('Boost')
provides=('tsv-utils')
conflicts=('tsv-utils')

source=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}_linux-x86_64_ldc2.tar.gz")
sha256sums=('557c701503fb9a07c04514439929b630f28097da4dd912f54f631e41a503569f')
_bin_files=(
    'csv2tsv'  'keep-header'  'number-lines'  'tsv-append'  'tsv-filter'  'tsv-join'  'tsv-pretty'  'tsv-sample'  'tsv-select'  'tsv-summarize'  'tsv-uniq'
)

package() {
    cd "${_pkgname}-v${pkgver}_linux-x86_64_ldc2"

    mkdir -p $pkgdir/usr/bin
    for file in "${_bin_files[@]}"; do
        install -m755 bin/$file $pkgdir/usr/bin/$file
    done

    mkdir -p $pkgdir/usr/share/licenses/$pkgname
    install -m644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"

    mkdir -p $pkgdir/usr/share/bash-completion/completions
    install -m755 bash_completion/tsv-utils $pkgdir/usr/share/bash-completion/completions/tsv-utils
}

