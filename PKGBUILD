# Maintainer: jpatufet <jpatufet86@gmail.com>

pkgname=mythes-ca
pkgver=1.5.0
pkgrel=1
pkgdesc="Catalan thesaurus"
arch=(any)
url="http://www.softcatala.org/wiki/Projectes/Openthesaurus-ca"
license=('GPL')
optdepends=('libmythes: offers thesaurus library functions')
source=('http://www.softcatala.org/diccionaris/actualitzacions/sinonims/thesaurus-ca.oxt')
md5sums=('47cb36896e71be0984f5750258d84907')

package(){

    #copy th
    cd "${srcdir}"
    install -dm755 "${pkgdir}"/usr/share/mythes
    cp -p dictionaries/th_ca_ES_v3.dat "${pkgdir}"/usr/share/mythes/th_ca_ES_v2.dat
    cp -p dictionaries/th_ca_ES_v3.idx "${pkgdir}"/usr/share/mythes/th_ca_ES_v2.idx

    #alias th
    pushd "${pkgdir}"/usr/share/mythes/
    ca_ES_alias="ca_AD ca_FR ca_IT"
    for lang in ${ca_ES_alias}; do
        ln -s th_ca_ES_v2.dat th_${lang}_v2.dat
        ln -s th_ca_ES_v2.idx th_${lang}_v2.idx
    done
    popd

    #myspell symlinks
    install -dm755 "${pkgdir}"/usr/share/myspell/dicts
    pushd "${pkgdir}"/usr/share/myspell/dicts
    for file in "${pkgdir}"/usr/share/mythes/*; do
        ln -sv /usr/share/mythes/"$(basename "${file}")" .
    done
    popd

    #docs
    #install -dm755 "${pkgdir}"/usr/share/doc/"${pkgname}"

}

