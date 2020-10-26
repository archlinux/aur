# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=rtoml
pkgname="python-${_pkgname}"
pkgver=0.4.0
pkgrel=1
pkgdesc="A better TOML library for python implemented in rust."
arch=('x86_64')
url="https://pypi.org/project/${_pkgname}"
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'python-setuptools-rust' 'rust')
source=("${pkgname}-${pkgver}.tar.gz::https://pypi.org/packages/source/${_pkgname:0:1}/${_pkgname/-/_}/${_pkgname/-/_}-${pkgver}.tar.gz")
sha256sums=('38539f5601f67fcd5cad2dee564b7a898471d21a030c81889d713e72ef963a5c')
b2sums=('cf471e7bb8e215e0f0d26a7ef7a087ce78a04bd506a0adadb405ed47ebd495a1f5aec743163087b4621beb5bdbc4850797e43ec8b5f8dd459df0179b4ea05b4d')

check() {
  cd "${_pkgname/-/_}-${pkgver}"

  export PYTHONPATH="build/lib"
  python setup.py test
}

package() {
  cd "${_pkgname/-/_}-${pkgver}"

  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
