# Maintainer: Marten Hoffmann <maa@mailbox.org>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Lam Duong <lamduongt94@gmail.com>

pkgname=python-fastcore
_pkgname=fastcore
pkgver=1.13.2
pkgrel=1
pkgdesc='Python supercharged for the fastai library'
arch=('any')
url='https://github.com/fastai/fastcore'
license=('Apache-2.0')
depends=(
  python
  python-matplotlib
  python-numpy
  python-pillow
)
makedepends=(
  python-build
  python-installer
  python-setuptools
)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/fastai/fastcore/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('b7b73920da13daf0728c42cd6fd3ee4e20163bffe8e3f28c2d957724a82a5c3e02403ca4beff27f438238c1dfb6739adc29b76c44992a5d671cd4b211542d8da')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

