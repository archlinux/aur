# Maintainer: Ali Mousavi <ali.mousavi[at]gmail[dot]com>
# https://github.com/tuxitop/PKGBUILDs

pkgname=hunspell-fa
pkgver=0.11
pkgrel=1
pkgdesc='Persian dictionaries for hunspell'
url='http://ftp.gnu.org/gnu/aspell/dict/0index.html'
arch=('any')
license=('LGPL2' 'GPL2')
depends=('hunspell')
makedepends=('aspell')
source=("http://ftp.gnu.org/gnu/aspell/dict/fa/aspell6-fa-${pkgver}-0.tar.bz2")
sha256sums=('482d26ea879a8ea02d9373952205f67e07c85a7550841b13b5079bb2f9f2e15b')

prepare() {
    cd "${srcdir}/aspell6-fa-${pkgver}-0"
    
    msg 'converting aspell dictionaries...'
    LANG=fa_IR.utf8 preunzip -d *.cwl
    cat *.wl > persian.wordlist
    wordlist2hunspell persian.wordlist fa_IR
}

    package() {
    cd "${srcdir}/aspell6-fa-${pkgver}-0"
    
    install -dm755 $pkgdir/usr/share/hunspell
    install -m644 fa_IR.dic fa_IR.aff $pkgdir/usr/share/hunspell

    # symlinks
    install -dm755 $pkgdir/usr/share/myspell/dicts
    ln -s /usr/share/hunspell/fa_IR.dic $pkgdir/usr/share/myspell/dicts/
    ln -s /usr/share/hunspell/fa_IR.aff $pkgdir/usr/share/myspell/dicts/

    # docs
    install -dm755 $pkgdir/usr/share/doc/$pkgname
    install -m644 README $pkgdir/usr/share/doc/$pkgname

    # licenses
    install -dm755 $pkgdir/usr/share/licenses/$pkgname
    install -m644 Copyright $pkgdir/usr/share/licenses/$pkgname
    install -m644 COPYING $pkgdir/usr/share/licenses/$pkgname
}

# vim:set ts=2 sw=2 et:

