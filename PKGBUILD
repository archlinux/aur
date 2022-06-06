#Maintainer: sukanka <su975853527 AT gmail.com>
_pkgname=jaspResults
_pkgver=1.16
pkgname=r-${_pkgname,,}
pkgver=1.16
pkgrel=1
pkgdesc="Easy results for your JASP analysis"
arch=('x86_64')
url="https://github.com/jasp-stats/${_pkgname}"
license=('GPL')
depends=(r
'r-rcpp'
)
groups=(r-jasp r-jaspbase)
makedepends=('git')
optdepends=('r-jaspgraphs')
source=("git+https://github.com/jasp-stats/${_pkgname}.git"
"jaspColumnEncoder::git+https://github.com/jasp-stats/jaspColumnEncoder.git"
)
sha256sums=('SKIP'
            'SKIP')

prepare(){
  cp -rf $srcdir/jaspColumnEncoder/* $srcdir/${_pkgname}/src/jaspColumnEncoder

}

build() {
  mkdir -p ${srcdir}/usr/lib/R/library
  R -e "install.packages('${srcdir}/${_pkgname}',\
     type='source', repos=NULL,lib='${srcdir}/usr/lib/R/library', INSTALL_opts='--no-multiarch --no-docs --no-test-load')"
}

package() {

  cp -a --no-preserve=ownership "${srcdir}/usr" "${pkgdir}"
}
