# Maintainer: ValHue <vhuelamo at gmail dot com>
# https://github.com/ValHue/AUR-PKGBUILDs
#
# Contributor: jpatufet <jpatufet86@gmail.com>
# Contributor: Jorge Barroso <jorge.barroso.11 at gmail dot com>

pkgname=hunspell-ca
pkgver=3.0.1
pkgrel=1
pkgdesc="Catalan hunspell dictionaries. Includes Valencian ca_ES-valencia"
arch=(any)
url="http://www.softcatala.org/corrector"
license=('GPL')
makedepends=('hunspell')
optdepends=('hunspell:	the spell checking libraries and apps')
source=('https://github.com/Softcatala/catalan-dict-tools/releases/download/v3.0.1/ca.3.0.1.oxt'
		'https://github.com/Softcatala/catalan-dict-tools/releases/download/v3.0.1/ca-valencia.3.0.1.oxt')
sha512sums=('db242848543dc0daf7be38ff0bade4aaa32e4049226f56b97f47479b18d740cb4df078bbb8f0c1187a309327282c69178991d1b42e9b3bee81229477c0676ed7'
            '6581ae5048de23f7573ec81a46ffc58354bdea85edbdacd6c56d39d6791245b8b0a977da79788bd18caff812cda77b8145d277eee2a194da6d67386c5377ea2a')

package(){

    #copy hunspell
    cd "${srcdir}"
    install -dm755 "${pkgdir}"/usr/share/hunspell
    cp -p ca.aff "${pkgdir}"/usr/share/hunspell/ca_ES.aff
    cp -p ca.dic "${pkgdir}"/usr/share/hunspell/ca_ES.dic
    cp -p ca-ES-valencia.aff     "${pkgdir}"/usr/share/hunspell/ca_ES-valencia.aff
    cp -p ca-ES-valencia.dic     "${pkgdir}"/usr/share/hunspell/ca_ES-valencia.dic
    
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

    # licenses
    install -dm755 "${pkgdir}"/usr/share/licenses/"${pkgname}"
    Copyright_ca_alias="ca_AD ca_ES ca_ES-valencia ca_FR ca_IT"
    pushd "${pkgdir}"/usr/share/licenses/"${pkgname}"
        for lang in ${Copyright_ca_alias}; do
            install -D -m644 "${srcdir}"/LLICENCIES-ca.txt Copyright_${lang}
        done
    popd

    
}

# vim:set ts=4 sw=2 ft=sh et:
