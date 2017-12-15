# Maintainer: Sebastian Wilzbach <seb [at] wilzbach [dot] me>
pkgname=tsv-utils
_pkgname=tsv-utils-dlang
pkgver=1.1.15
pkgrel=1
pkgdesc="Command line tools for large, tabular data files. Filtering, statistics, sampling, joins and more."
arch=('i686' 'x86_64')
groups=('dlang')
url="https://github.com/eBay/tsv-utils-dlang"
license=('BSL-1.0')
depends=('clang' 'liblphobos')
makedepends=('git' 'dub' 'ldc' 'liblphobos' 'make')
source=(
    "git+https://github.com/eBay/tsv-utils-dlang.git#tag=v$pkgver"
)
sha1sums=('SKIP')

bin_files=(
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
    for file in "${bin_files[@]}"; do
        install -m755 bin/$file $pkgdir/usr/bin/$file
    done
    mkdir -p $pkgdir/usr/share/licenses/$pkgname
    mkdir -p $pkgdir/usr/share/bash-completion/completions
    install -m755 bash_completion/tsv-utils-dlang $pkgdir/usr/share/bash-completion/completions/tsv-utils
    install -m644 LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
}
