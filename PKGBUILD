# Maintainer: Jacob Mourelos <jacob.mourelos@gmail.com>

pkgname=hunspell-gl
pkgver=20141115
pkgrel=1
pkgdesc="Galician hunspell dictionaries. RAG/ILG normative"
arch=(any)
url="https://github.com/meixome/hunspell-gl"
license=('GPL3')
optdepends=('hunspell:  the spell checking libraries and apps')
source=(http://sourceforge.net/projects/hunspell-gl/files/instantaneas/$pkgver/hunspell-gl-comunidade-$pkgver.tar.xz)
md5sums=('5cec824e0a7411b0da6712b5826a0d22')

package(){
    cd "$srcdir"
    install -dm755 ${pkgdir}/usr/share/hunspell
    install -m644 gl_ES.dic gl_ES.aff $pkgdir/usr/share/hunspell
    
    # myspell symlinks
    install -dm755 ${pkgdir}/usr/share/myspell/dicts
    pushd $pkgdir/usr/share/myspell/dicts
    for file in $pkgdir/usr/share/hunspell/*; do
        ln -sv /usr/share/hunspell/$(basename $file) .
    done
    popd

    # docs
    install -dm755 $pkgdir/usr/share/doc/$pkgname
    install -m644 install.txt $pkgdir/usr/share/doc/$pkgname/INSTALL
    install -m644 readme.txt $pkgdir/usr/share/doc/$pkgname/README

    # licenses
    install -D -m644 license.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

