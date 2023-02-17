# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Laszlo Papp <djszapi @ gmail at com>

pkgname=vim-manpageview
_pkgname=manpageview
pkgver=25w
pkgrel=1
pkgdesc='Viewer for manpages, gnu info,  perldoc, and php (unix/linux/cygwin)'
arch=('any')
url='http://www.drchip.org/astronaut/vim/index.html#MANPAGEVIEW'
license=('custom:vim')
depends=('vim-runtime' 'vim-align')
groups=('vim-plugins')
install='vimdoc.install'
source=(
$_pkgname-$pkgver.vba.gz::http://www.drchip.org/astronaut/vim/vbafiles/manpageview.vba.gz
license.txt
manpageview.vim.diff
)
sha256sums=('2f30233d462ea42ad50864d4485cfb0ec3472a0eda3207ce7e8d0d5a141a169c'
            'bce42e8c4290de3b4262045a48e0d794436b57f0c666f811b4b8021db4c1c603'
            '631b1740fe13d016d234a2475ef0d0f8665a2e967b1a92b32291468a5b3d3713')
options=(!strip)

build() {
    cd "$srcdir"
    vim -c "UseVimball $srcdir" -c "q" "$_pkgname-$pkgver.vba"

    patch -Np1 -i manpageview.vim.diff
}
package(){
    cd "$srcdir"
    _vimdir='/usr/share/vim/vimfiles'
    install -dm755 "$pkgdir/${_vimdir}"
    tar -c ./ \
        --exclude doc/tags \
        --exclude .VimballRecord \
        --exclude license.txt \
        --exclude $_pkgname-$pkgver.vba \
        --exclude $_pkgname-$pkgver.vba.gz \
        --exclude manpageview.vim.diff \
        --exclude autoload/manpageview.vim.orig \
        --exclude plugin/cecutil.vim \
        | tar -xC "$pkgdir/${_vimdir}"
    install -Dm644 license.txt $pkgdir/usr/share/licenses/$pkgname/license.txt
}
