# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=parsita
pkgname="python-${_pkgname}"
pkgver=1.5.0
pkgrel=1
pkgdesc="Parser combinator library for Python."
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://pypi.org/packages/source/${_pkgname:0:1}/${_pkgname/-/_}/${_pkgname/-/_}-${pkgver}.tar.gz"
        LICENSE)
sha256sums=('85dc1fc75156e2b3eb95518ab88871ed4d3135a2e1b627f77b42ef9f1ef75c57'
            '0d9510b6afe453291bc7fecc863b17d15d9b7931c5c55e22b55b93ba6195ff70')
b2sums=('e778f33fd6c7a5356321f96731a3ada97e3cdf0b30a7ce9935d13a95889043d3f7336aac78a39b4d45b94e9e353f1b4d6cdade64969b059bf0caf18181d9c62e'
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
