# Maintainer: brent s. <bts[at]square-r00t[dot]net>
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Past maintainer: Mauro Andreolini <mauro.andreolini@unimore.it>

pkgname=pack
_pkgname=PACK
pkgver=0.0.4
pkgrel=4
pkgdesc="Password Analysis and Cracking Kit"
url="http://thesprawl.org/projects/pack/"
arch=('i686' 'x86_64')
license=('unknown')
depends=('python2' 'aspell' 'aspell-en')
makedepends=()
source=("http://thesprawl.org/media/projects/${_pkgname}-${pkgver}.tar.gz"
    "fix-python2-invocation.patch"
    "reorganize-enchant-modules.patch"
    "fix-rulegen-module-refs.patch"
    "${_pkgname}-${pkgver}.tar.gz.sig"
    "fix-python2-invocation.patch.sig"
    "reorganize-enchant-modules.patch"
    "fix-rulegen-module-refs.patch")

sha512sums=('0b134d7119daac50f47134d7e8fd8563934390460cb042a3069f90a473a864cd0488e6bbd535bef8fb727cbe1035ed77abdcb2f94f3078d4de8cfbd0dec638f0'
            '2188a1578a15cf4a011346818608fcdab835b468f88ca4bbc93b885ec7d0808da83750b93a1be0c3d19033b66b89007fe6190be687848eb998e0e89c8f6e48d6'
            'faf3b17304ffb7820bbe795d8d73c0d84d8ae5e108e2bdcea97584ffbb91c155061f89be859354c9077c6d8eb6d1a7160e7a4a9b98ae7cabcd5e11e90930d63e'
            '475506f54d70524b5c1630119aa60e8fd799bf1612ddaad874c129ddd7d3467f2d7b3078c08670c6279653d98d94f85bbbe5831413dc7a9dd03f91bcef8c3a45'
            'SKIP'
            'SKIP'
            'faf3b17304ffb7820bbe795d8d73c0d84d8ae5e108e2bdcea97584ffbb91c155061f89be859354c9077c6d8eb6d1a7160e7a4a9b98ae7cabcd5e11e90930d63e'
            '475506f54d70524b5c1630119aa60e8fd799bf1612ddaad874c129ddd7d3467f2d7b3078c08670c6279653d98d94f85bbbe5831413dc7a9dd03f91bcef8c3a45')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}

    patch -Np1 -i ../fix-python2-invocation.patch 
    patch -Np1 -i ../reorganize-enchant-modules.patch
    patch -Np1 -i ../fix-rulegen-module-refs.patch

    mkdir ${pkgname}
    mv enchant ${pkgname}
    touch ${pkgname}/__init__.py
}

package() {
    install -d ${pkgdir}/usr/bin || return 1
    install -d ${pkgdir}/usr/share/${pkgname}/doc || return 1
    install -Dm755 ${srcdir}/${_pkgname}-${pkgver}/maskgen.py ${pkgdir}/usr/bin/maskgen.py
    install -Dm755 ${srcdir}/${_pkgname}-${pkgver}/policygen.py ${pkgdir}/usr/bin/policygen.py
    install -Dm755 ${srcdir}/${_pkgname}-${pkgver}/rulegen.py ${pkgdir}/usr/bin/rulegen.py
    install -Dm644 ${srcdir}/${_pkgname}-${pkgver}/README ${pkgdir}/usr/share/${pkgname}/doc/README

    install -dm755 ${pkgdir}/usr/lib/python2.7/${pkgname}
    install -Dm644 ${srcdir}/${_pkgname}-${pkgver}/${pkgname}/__init__.py ${pkgdir}/usr/lib/python2.7/${pkgname}

    install -dm755 ${pkgdir}/usr/lib/python2.7/${pkgname}/enchant
    install -Dm644 ${srcdir}/${_pkgname}-${pkgver}/${pkgname}/enchant/*.py ${pkgdir}/usr/lib/python2.7/${pkgname}/enchant
    install -dm755 ${pkgdir}/usr/lib/python2.7/${pkgname}/enchant/checker
    install -Dm644 ${srcdir}/${_pkgname}-${pkgver}/${pkgname}/enchant/checker/*.py ${pkgdir}/usr/lib/python2.7/${pkgname}/enchant/checker
    install -dm755 ${pkgdir}/usr/lib/python2.7/${pkgname}/enchant/lib/enchant
    install -Dm644 ${srcdir}/${_pkgname}-${pkgver}/${pkgname}/enchant/lib/enchant/README.txt ${pkgdir}/usr/lib/python2.7/${pkgname}/enchant/lib/enchant/README.txt

    install -dm755 ${pkgdir}/usr/lib/python2.7/${pkgname}/enchant/share/enchant
    install -Dm644 ${srcdir}/${_pkgname}-${pkgver}/${pkgname}/enchant/share/enchant/README.txt ${pkgdir}/usr/lib/python2.7/${pkgname}/enchant/share/enchant/README.txt
    install -dm755 ${pkgdir}/usr/lib/python2.7/${pkgname}/enchant/share/enchant/ispell
    install -Dm644 ${srcdir}/${_pkgname}-${pkgver}/${pkgname}/enchant/share/enchant/ispell/README.txt ${pkgdir}/usr/lib/python2.7/${pkgname}/enchant/share/enchant/ispell/README.txt
    install -dm755 ${pkgdir}/usr/lib/python2.7/${pkgname}/enchant/share/enchant/myspell
    install -Dm644 ${srcdir}/${_pkgname}-${pkgver}/${pkgname}/enchant/share/enchant/myspell/README.txt ${pkgdir}/usr/lib/python2.7/${pkgname}/enchant/share/enchant/myspell/README.txt

    install -dm755 ${pkgdir}/usr/lib/python2.7/${pkgname}/enchant/tokenize
    install -Dm644 ${srcdir}/${_pkgname}-${pkgver}/${pkgname}/enchant/tokenize/*.py ${pkgdir}/usr/lib/python2.7/${pkgname}/enchant/tokenize
}

