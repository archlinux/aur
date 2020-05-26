# Maintainer: Nikos Skalkotos <skalkoto at gmail dot com>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Dennis Værum <dennis.vaerum (at) gmail (dot) com> 
# Contributor: Achilleas Pipinellis <axilleas archlinux info>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: kfgz <kfgz at interia pl>
# Contributor: Gökmen Görgen <gkmngrgn at gmail dot com>
# Contributor: Baurzhan Muftakhidinov <baurthefirst (at) gmail (dot) com>

_pkgname=pyparted
pkgname=python-${_pkgname}
pkgver=3.11.6
pkgrel=1
pkgdesc="Python module for GNU parted"
url="https://github.com/dcantrell/pyparted"
arch=('i686' 'x86_64')
license=('GPL2')
makedepends=('pkg-config' 'python>=3.5' 'parted>=3.0')
conflicts=('pyparted-git')
replaces=('pyparted')
source=("https://github.com/dcantrell/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('6be03c0e44d474088ad5e432fdea077a8f1379877d09c1ff234e38b58067b5d2538fe3607af747bb8c917e3118766d528e07bdce1837e9d5a0ab908b9731173c')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  depends=('python' 'parted>=3.0')

  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm755 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  install -Dm755 AUTHORS "${pkgdir}/usr/share/doc/${pkgname}/AUTHORS"
  install -Dm755 TODO "${pkgdir}/usr/share/doc/${pkgname}/TODO"
  install -Dm755 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}
