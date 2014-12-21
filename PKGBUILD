# Contributor: Tilman Blumenbach <tilman (at) ax86 (dot) net>

pkgbase='selfhtml'
pkgname=('selfhtml-de' 'selfhtml-fr')
pkgver='8.1.2'
pkgdesc='An excellent HTML reference which also covers other web topics'
pkgrel=3
arch=('any')
url='http://selfhtml.org'
license=('custom')
source=('http://ftp.uni-ulm.de/mirrors/selfhtml/selfhtml812.zip'
        'http://actuel.fr.selfhtml.org/supplements/selfhtml80fr.zip'
        'http://actuel.fr.selfhtml.org/supplements/selfhtml812-update.zip')
noextract=('selfhtml812.zip'
           'selfhtml80fr.zip'
           'selfhtml812-update.zip')

prepare() {
    cd "$srcdir"

    # German files
    mkdir selfhtml_de
    unzip -od selfhtml_de selfhtml812.zip

    # French files
    unzip -o selfhtml80fr.zip
    unzip -o selfhtml812-update.zip
}

# $1: Language code
_do_package() {
    cd "$srcdir/selfhtml_$1"
    
    # Fix permissions
    find . -type f '!' -perm 0644 -execdir chmod 0644 {} ';'
    find . -type d '!' -perm 0755 -execdir chmod 0755 {} ';'

    mkdir -p "$pkgdir/usr/share/doc/selfhtml/$1"
    mkdir -p "$pkgdir/usr/share/licenses/selfhtml/$1"

    cp -a . "$pkgdir/usr/share/doc/selfhtml/$1"
    ln -s "/usr/share/doc/selfhtml/$1/editorial/copyright.htm" "$pkgdir/usr/share/licenses/selfhtml/$1"
}

package_selfhtml-de() {
    # Need to do this here so that mkaurball correctly extracts these variables.
    pkgdesc="An excellent HTML reference which also covers other web topics (German version)"
    url="http://de.selfhtml.org"

    _do_package de
}

package_selfhtml-fr() {
    # Need to do this here so that mkaurball correctly extracts these variables.
    pkgdesc="An excellent HTML reference which also covers other web topics (French version)"
    url="http://fr.selfhtml.org"

    _do_package fr
}

md5sums=('81806920c148ace4f24e8a8239f075ac'
         'bd92e3bf5da0f1d1c1c9fea04794657d'
         'e32206dc42c01baeb7294b1cc3de7d65')
sha384sums=('8d3e2db171642aaf31d7883c9429251214d5ede5123f51650d61596e786e48d74c048d9b0758a7fcbe1f7b2880cebf03'
            '107dc1d1df50d6ee6f887faa9fad8b43905aad99801228e3d7b39897c74c43b27a8d4cd8492c1eac9ba1795d45263a50'
            'e2a80badab761e93ffa068053ab1540d1ca5eeb931bef7c6f2f6be9d1f1858d7eac2985d7a5e344c916bfc7d0a866ca7')
