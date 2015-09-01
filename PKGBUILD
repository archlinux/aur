# Maintainer: William J. Bowman <aur@williamjbowman.com>
# Contributor: Kohei Suzuki <eagletmt@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Nathan Owe <ndowens.aur at gmail dot com>
# Contributor: George Giorgidze <giorgidze@gmail.com>
# Contributor: Massimiliano Brocchini <brocchini@netseven.it>

pkgname=camlp5-transitional
_baseversion=6.14
_patchlevel=0
#pkgver=${_baseversion}.${_patchlevel}
pkgver=${_baseversion}
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc='A preprocessor-pretty-printer of OCaml. (transitional)'
conflicts=('camlp5')
url='http://camlp5.gforge.inria.fr/'
license=('BSD')
depends=('ocaml')
sha1sums=('2cde94fc53195f9acb39592a9a74d4f36114df38')
sha256sums=('09f9ed12893d2ec39c88106af2306865c966096bedce0250f2fe52b67d2480e2')
sha512sums=('7dd57b8725953099726fc2e5f6dda01ed74485a4bbf41cb30ccd2163ee38bc6dff36fd83069c58d7990522527d266c9e180a8e333b36a42bc216315dc88a25e9')
source=("http://camlp5.gforge.inria.fr/distrib/src/camlp5-${_baseversion}.tgz")
# upstream likes to release occasional patches instead of releasing new versions
for i in $(seq ${_patchlevel}); do
  source+=("http://camlp5.gforge.inria.fr/distrib/src/patch-${_baseversion}-${i}")
done
options=('staticlibs')

build() {
  cd camlp5-${_baseversion}

  for i in $(seq ${_patchlevel}); do
    patch -Np0 -i ${srcdir}/patch-${_baseversion}-${i}
  done

  cd ${srcdir}/camlp5-${_baseversion}

  ./configure \
    -prefix '/usr' \
    -mandir '/usr/share/man' \
    -transitional

  make world.opt
}

package() {
  cd camlp5-${_baseversion}

  make DESTDIR=${pkgdir} install

  install -D -m644 LICENSE \
    ${pkgdir}/usr/share/licenses/camlp5/LICENSE
}



