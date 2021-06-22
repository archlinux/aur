# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>
# Contributer: Dmitri Goutnik <dg@syrec.org>

pkgname=pspg
pkgver=5.0.4
pkgrel=2
pkgdesc='Tabular data pager designed to be used with psql'
arch=('x86_64')
url="https://github.com/okbob/pspg"
license=('BSD')
depends=('ncurses' 'readline' 'postgresql-libs')
conflicts=('pspg-git')

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")

sha256sums=('e7c95a717cdba45e14961740fecd4c2824a4d78aef5629c3d197bc3264e7520c')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}/" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 bash-completion.sh "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
}

# vim:set ts=2 sw=2 et:
