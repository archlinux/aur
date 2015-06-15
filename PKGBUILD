#! /bin/sh
# Maintainer: jpatufet <jpatufet86@gmail.com>
# Contributor: Jorge Barroso <jorge.barroso.11 at gmail dot com>

pkgname=hunspell-ca
pkgver=2.5.0
pkgrel=2
pkgdesc="Catalan hunspell dictionaries. Includes Valencian ca_ES-valencia "
arch=(any)
url="http://www.softcatala.org/corrector"
license=('GPL')
makedepends=('hunspell')
optdepends=('hunspell:	the spell checking libraries and apps')
source=('http://www.softcatala.org/diccionaris/actualitzacions/OOo/catalan.oxt'
	'http://www.softcatala.org/diccionaris/actualitzacions/OOo/avl.oxt')
sha512sums=('4ce4bf3d9aac357d16261851443318dee8a8667556caa480c6cd778a6a15a7bf4d77980ba4c0549e7012361a051f42ebdf373f83aafc9a5797f7c6638016b18f'
            '408acf1a46e6dc7f6669b5bbb9fd460d68bb950bed9b0a9c6eb05134f5b0ff8c986876b6fa26f3cf1a0ad252cedb6a80068135cca3fb8bc5d1c8da3fd1ed0a70')

package(){

    #copy hunspell
    cd "${srcdir}"
    install -dm755 "${pkgdir}"/usr/share/hunspell
    cp -p dictionaries/catalan.aff "${pkgdir}"/usr/share/hunspell/ca_ES.aff
    cp -p dictionaries/catalan.dic "${pkgdir}"/usr/share/hunspell/ca_ES.dic
    cp -p dictionaries/avl.aff "${pkgdir}"/usr/share/hunspell/ca_ES-valencia.aff
    cp -p dictionaries/avl.dic "${pkgdir}"/usr/share/hunspell/ca_ES-valencia.dic
    
    #alias hunspell - comment/delete if you don't want all these alias
    ca_ES_alias="ca_AD ca_FR ca_IT"
    pushd "${pkgdir}"/usr/share/hunspell/
    for lang in ${ca_ES_alias}; do
        ln -s ca_ES.aff "${lang}".aff
        ln -s ca_ES.dic "${lang}".dic
    done
    popd

    #myspell symlinks
    install -dm755 "${pkgdir}"/usr/share/myspell/dicts
    pushd "${pkgdir}"/usr/share/myspell/dicts
    for file in "${pkgdir}"/usr/share/hunspell/*; do
        ln -sv /usr/share/hunspell/"$(basename "${file}")" .
    done
    popd

    #docs
    #install -dm755 "${pkgdir}"/usr/share/doc/"${pkgname}"
    
}

