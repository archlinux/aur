# Maintainer: Jakub Klinkovský <kuba.klinkovsky@gmail.com>

pkgname="hyphen-cs"
pkgdesc="Czech hyphenation rules"
pkgver=20061030
pkgrel=1
arch=("any")
optdepends=("hyphen: offers hyphenation library functions")
url="http://ooo.mirror.dkm.cz/pub/openoffice/contrib/dictionaries/"
license=("GPL2")
source=(${url}hyph_cs_CZ.zip)
md5sums=('7dc7192fb3c141db6518c54781df6846')

build() {
    /bin/true
}

package() {
    cd "$srcdir"
    install -dm755 ${pkgdir}/usr/share/hyphen
    install -m644 hyph_cs_CZ.dic ${pkgdir}/usr/share/hyphen

    # the symlinks
    install -dm755 ${pkgdir}/usr/share/myspell/dicts
    pushd ${pkgdir}/usr/share/myspell/dicts
        for file in ${pkgdir}/usr/share/hyphen/*; do
            ln -sv /usr/share/hyphen/$(basename $file) .
        done
    popd

    # docs
    install -dm755 ${pkgdir}/usr/share/doc/$pkgname
    install -m644 README_hyph_cs_CZ.txt ${pkgdir}/usr/share/doc/$pkgname
}
