# Maintainer: Andrew Anderson <andersan@tcd.ie>
pkgname=trinnity-optimizer-git
pkgver=0.1
pkgrel=4
pkgdesc="The triNNity DNN optimizer"
arch=('any')
url="https://bitbucket.org/STG-TCD/trinnity-optimizer"
license=('BSD')
groups=()
depends=()
makedepends=('stack')
checkdepends=()
optdepends=('pbqp: PBQP solver backend')
provides=()
conflicts=()
replaces=()
backup=()
options=()
source=("git+https://bitbucket.org/STG-TCD/trinnity-optimizer")
sha512sums=("SKIP")

build() {
  cd trinnity-optimizer && stack build
}

package() {
  BUILTBIN=`find ${srcdir}/trinnity-optimizer/.stack-work/install -iname "trinnity-optimizer"`
  echo $BUILTBIN
  mkdir -p ${pkgdir}/usr/bin
  install -ma=rx $BUILTBIN ${pkgdir}/usr/bin
  mkdir -p ${pkgdir}/usr/share/bash-completion/completions/
  cd ${pkgdir}/usr/bin/ && triNNity-optimizer --bash-completion-script "/usr/bin/triNNity-optimizer" > ${pkgdir}/usr/share/bash-completion/completions/triNNity-optimizer
}
