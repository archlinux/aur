#PKGBUILD Maintainer: Rafael Reggiani Manzo <rr.manzo#gmail.com>

pkgname=doxyparse
_actual_ver=1.5.9
_extra_ver=20090622
pkgver=${_actual_ver}_${_extra_ver}
pkgrel=6
pkgdesc="Parses source code and dumps the dependencies between the code elements."
groups=('analizo')
arch=('any')
url="http://analizo.org"
license=('GPLv2')
makedepends=('qt4' 'git' 'flex')
source=(
        "qtools.patch"
        "Fix-Flex-version-compilation-restriction.patch"
        "https://github.com/analizo/doxyparse/archive/upstream/${_actual_ver}.tar.gz"
       )
sha512sums=(
            '8095af5f6ba616864be6389b4245ab7a3a3723298635831c4f714468d6768cf86a382802ad8189053414f7701654ef683d1342936a31b98208ebf78f5e92485a'
            '362a68214fcd90a1f5cfcab6c0bb9c10fb2b51ecb0de1232f17d56b30e5713fcdc4dcb587a861b7629bdcff5a4ae3d28458d460ac2a9c6060eadcc33cef95da0'
            '18d13d27f93f74636df457be36d1c27328051d586448d909042d2fcedd39170f396c3c7c4061a522f1e24fab69daf125d37a534d133d3083e7beb42cb8f7b6ac'
           )

build(){
  cd "${srcdir}"

  cp "${srcdir}/qtools.patch" "doxyparse-upstream-${_actual_ver}"
  cp "${srcdir}/Fix-Flex-version-compilation-restriction.patch" "doxyparse-upstream-${_actual_ver}"
  cd "doxyparse-upstream-${_actual_ver}"
  patch -p1 < qtools.patch
  patch -p1 < Fix-Flex-version-compilation-restriction.patch
  ./configure --with-doxyparse
  make
}

check() {
  cd "${srcdir}/doxyparse-upstream-${_actual_ver}"

  make check || :
}

package(){
  cd "${srcdir}/doxyparse-upstream-${_actual_ver}"

  make DESTDIR="${pkgdir}/" install
}

