# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=parsita
pkgname="python-${_pkgname}"
pkgver=1.4.0
pkgrel=1
pkgdesc="Parser combinator library for Python."
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://pypi.org/packages/source/${_pkgname:0:1}/${_pkgname/-/_}/${_pkgname/-/_}-${pkgver}.tar.gz"
        LICENSE)
sha256sums=('084707eb2459f2ad9baf03c0408789362f63b52e3797431c10c7b99c1a43095f'
            '0d9510b6afe453291bc7fecc863b17d15d9b7931c5c55e22b55b93ba6195ff70')
b2sums=('7968e65806a8d44ce0739ddf8a303ffa728f61445f6fec12c486f35b7363b21d6bd0a09443f3ff993dabb3c5f6b8cbaef771cf3d4d7802ab94225dd191125a96'
        'b058113fdc8cbeaf79c8adbc5df46b92cd7d415d8793ccf52fb98fa2bcc668630164134ae05c0a5ac2ed4c8acf51fc7d43c2e6ec77282dc9058a1fae3819e957')

build() {
  cd "${_pkgname/-/_}-${pkgver}"

  python setup.py build
}

check() {
  cd "${_pkgname/-/_}-${pkgver}"

  export PYTHONPATH="build/lib"
  python setup.py test
}

package() {
  cd "${_pkgname/-/_}-${pkgver}"

  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm0644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
