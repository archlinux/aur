# Maintainer: jpatufet <jpatufet86@gmail.com>

pkgname=hyphen-ca
pkgver=1.2
pkgrel=1
pkgdesc="Catalan hyphenation rules"
arch=(any)
url="http://riuraueditors.cat/web/content/12-eines"
license=('GPLv3')
optdepends=('hyphen: offers hyphenation library functions')
source=('http://riuraueditors.cat/particio_de_mots/hyph_ca_ES.dic')
sha512sums=('c86482576fd93ae5c91d47201af872f996fd8013d0f1c6242aa8843958b6ead63d90ff203ba52cfd4ed25da32d3cf48eea6690f0d3b7e2de0c20f2f2ef0fd465')


package(){

    #copy hypen
    cd "${srcdir}"
    install -dm755 "${pkgdir}"/usr/share/hyphen
    cp -p hyph_ca_ES.dic "${pkgdir}"/usr/share/hyphen/hyph_ca_ES.dic

    #alias hyphen - comment/delete if you don't want all these alias
    pushd "${pkgdir}"/usr/share/hyphen/
    ca_ES_alias="ca_AD ca_FR ca_IT"
    for lang in ${ca_ES_alias}; do
        ln -s hyph_ca_ES.dic hyph_${lang}.dic
    done
    popd

    #myspell symlinks
    install -dm755 "${pkgdir}"/usr/share/myspell/dicts
    pushd "${pkgdir}"/usr/share/myspell/dicts
    for file in "${pkgdir}"/usr/share/hyphen/*; do
        ln -sv /usr/share/hyphen/"$(basename "${file}")" .
    done
    popd

    #docs
    #install -dm755 "${pkgdir}"/usr/share/doc/"${pkgname}"
}
