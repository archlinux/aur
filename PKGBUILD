# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Andrew Steinke <rkcf@rkcf.me>
_base=lxc
pkgname=python-${_base}
pkgrel=1
pkgver=3.0.4
pkgdesc="Python3 bindings for LXC"
depends=(python lxc)
makedepends=(python-setuptools)
url="https://github.com/${_base}/${pkgname/-/3-}"
license=(LGPL2)
arch=(x86_64)
source=(${url}/archive/${pkgname/-/3-}-${pkgver}.tar.gz)
sha512sums=('740a7fb0aa3b0c10e98a825642ea09f7c7f02061f4d5b88cb95985acd34ff5ceffdd3975a08c4592268a45dfda0f68c2d82626d5deb9075362fc7cc77ab8eeef')

build() {
  cd "${pkgname/-/3-}-${pkgname/-/3-}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname/-/3-}-${pkgname/-/3-}-${pkgver}"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
