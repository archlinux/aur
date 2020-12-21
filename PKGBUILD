# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=python-fints
pkgver=3.0.1
pkgrel=1
pkgdesc="Minimal pure-python FinTS (formerly known as HBCI) implementation"
arch=(any)
url="https://github.com/raphaelm/python-fints"
license=('LGPL')
depends=('python' 'python-mt-940' 'python-bleach' 'python-sepaxml' 'python-requests')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-pytest-mock')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/raphaelm/python-fints/archive/v${pkgver}.tar.gz")
sha512sums=('78dd0e895bc075fd80f43ae16b16eedc7d2978ae8e0c9b4b3eb47b11550a2dc61962b1864ea63ce3ccd842acd0fa6dc2db98ea1b1fd7c1d23c4227ea352c01ce')
b2sums=('13a62e1ec7a43a8cd0196e01eb1c60471b09f89ef2cb55cce7908de1b76f38a063c63bb4121a48206869424c2fedf23fd176248862c96f183e7b960ac5f8137a')

build() {
  cd "${pkgname}-${pkgver}"
  export PYTHONHASHSEED=0
  python setup.py build
}

check() {
  cd "${pkgname}-${pkgver}"
  PYTHONPATH=. pytest
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}" --skip-build
}

# vim:set ts=2 sw=2 et:
