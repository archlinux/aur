# Maintainer: Sauliusl <luksaulius[at]gmail[dot]com>
# Based on the pkgbuild for sickle
pkgname=scythe-git
pkgver='133.20d3cff' # At the time of packaging, overriden using the function below

pkgrel=1
pkgdesc="A Bayesian adapter trimmer"
arch=('i686' 'x86_64')
url="https://github.com/vsbuffalo/scythe"
license=('custom')
depends=('zlib')
source=('scythe-git::git+https://github.com/vsbuffalo/scythe.git')
md5sums=('SKIP')

pkgver() {
  # Based on awish-git
  cd "${srcdir}/${pkgname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${srcdir}/${pkgname}"
  make all;
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm755 scythe "${pkgdir}/usr/bin/scythe"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 illumina_adapters.fa "${pkgdir}/usr/share/scythe/illumina_adapters.fa"
}