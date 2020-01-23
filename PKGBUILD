# Contributer: Sebastian Wilzbach <seb [at] wilzbach [dot] me>
# Maintainer: Bug <bug2000@gmail.com>
pkgname=tsv-utils
_pkgname=tsv-utils-dlang
pkgver=1.4.4
pkgrel=2
pkgdesc="Command line tools for large, tabular data files. Filtering, statistics, sampling, joins and more."
arch=('i686' 'x86_64')
groups=('dlang')
url="https://github.com/eBay/tsv-utils"
license=('Boost')
depends=('liblphobos')
makedepends=('git' 'dub' 'ldc' 'make')
source=(
    "git+https://github.com/eBay/tsv-utils.git#tag=v$pkgver"
)
sha1sums=('SKIP')

_bin_files=(
    'csv2tsv' 'number-lines' 'tsv-filter' 'tsv-pretty' 'tsv-select' 'tsv-uniq'
    'keep-header' 'tsv-append' 'tsv-join' 'tsv-sample' 'tsv-summarize'
)

build ()
{
    cd $srcdir/$_pkgname
    make DCOMPILER=ldc2
}

package ()
{
    cd $srcdir/$_pkgname
    mkdir -p $pkgdir/usr/bin
    for file in "${_bin_files[@]}"; do
        install -m755 bin/$file $pkgdir/usr/bin/$file
    done
    mkdir -p $pkgdir/usr/share/doc/$pkgname
    mkdir -p $pkgdir/usr/share/licenses/$pkgname
    mkdir -p $pkgdir/usr/share/bash-completion/completions
    install -m755 bash_completion/tsv-utils $pkgdir/usr/share/bash-completion/completions/tsv-utils
    install -m644 LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
    install -m644 docs/*.md $pkgdir/usr/share/doc/$pkgname/
}
