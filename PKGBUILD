# $Id$
# Maintainer: Grey Christoforo <grey at christoforo dot net>

pkgname=python-macs
pkgver=2.2.7.1
pkgrel=1
pkgdesc="MACS -- Model-based Analysis of ChIP-Seq"
arch=('x86_64')
url="https://macs3-project.github.io/MACS/"
license=('BSD')
conflicts=('python2-macs2')
replaces=('python2-macs2')
depends=('python-numpy')
makedepends=('python-setuptools')
source=("https://github.com/macs3-project/MACS/archive/v${pkgver}.tar.gz")
md5sums=('3b669e6b847e5d2edd9b9ab4b58edae9')

prepare() {
  cd "MACS-${pkgver}"
  
  # don't call pip
  curl https://github.com/greyltc/MACS/commit/c39b55d8dfa6d57cb4d11e37b7f0947f7629702e.patch | patch -p1
}

build() {
  cd "MACS-${pkgver}"
  python setup.py build
}

package(){
  cd "MACS-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
