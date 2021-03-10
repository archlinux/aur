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
pkgver=3.11.7
pkgrel=1
pkgdesc="Python module for GNU parted"
url="https://github.com/dcantrell/pyparted"
arch=('i686' 'x86_64')
license=('GPL2')
makedepends=('pkg-config' 'python>=3.5' 'parted>=3.0')
conflicts=('pyparted-git')
replaces=('pyparted')
source=("https://github.com/dcantrell/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('41018989c21aab577cd1d51f521128d072b346afb9dcdcc27490cdbc2ed4382a854e4bd16780da72a0a95bbd521f14ee0e7f02816f34656cbae734d43a4f0b83')

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
