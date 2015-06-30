# Maintainer: Archer777 <NAME at gmx dot com>

_gitname='perlomni.vim'
pkgname='vim-perlomni-git'
pkgver=2.5
pkgrel=2
pkgdesc='perl omnicompletion for vim (including base class function compleltions .. etc)'
arch=('any')
url="https://github.com/c9s/${_gitname}"
license=('MIT')
depends=('vim')
makedepends=('git')
source=("git+https://github.com/c9s/${_gitname}"
        "LICENSE")
md5sums=('SKIP'
         '3c5991a7e0696f045904ea61828754fe')

pkgver() {
	cd "${srcdir}/${_gitname}/ftplugin/perl/"
    cat perlomni.vim | grep 'Version' | sed 's/^.*: //'
}

package() {
    cd "${srcdir}/${_gitname}"
    installpath="${pkgdir}/usr/share/vim/vimfiles"

    install -Dm644 autoload/perlomni/data.vim \
        ${installpath}/autoload/perlomni/data.vim

    install -m644 autoload/perlomni/util.vim \
        ${installpath}/autoload/perlomni/util.vim

    install -Dm644 ftplugin/perl/perlomni.vim \
        ${installpath}/ftplugin/perl/perlomni.vim
    
    install -Dm644 bin/grep-objvar.pl \
        ${installpath}/bin/grep-objvar.pl

    install -m644 bin/grep-pattern.pl \
        ${installpath}/bin/grep-pattern.pl

    install -Dm644 $srcdir/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
