# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=parsita
pkgname="python-${_pkgname}"
pkgver=1.6.0
pkgrel=1
pkgdesc="Parser combinator library for Python."
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://pypi.org/packages/source/${_pkgname:0:1}/${_pkgname/-/_}/${_pkgname/-/_}-${pkgver}.tar.gz"
        LICENSE)
sha256sums=('ed0d43d866b375dea775386bffd2e4e143de8277f997e7fe21c7640ab84f9e28'
            '0d9510b6afe453291bc7fecc863b17d15d9b7931c5c55e22b55b93ba6195ff70')
b2sums=('cbb8ad3a50bede142d5191c5cf7537ff9cc8d9905261680fab148d2352379517d5c89018ced06eb2821e5bb4d89956b6a52811d5d68d0d10af0402322d7b46bc'
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
