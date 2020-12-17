# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=parsita
pkgname="python-${_pkgname}"
pkgver=1.4.1
pkgrel=1
pkgdesc="Parser combinator library for Python."
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://pypi.org/packages/source/${_pkgname:0:1}/${_pkgname/-/_}/${_pkgname/-/_}-${pkgver}.tar.gz"
        LICENSE)
sha256sums=('ab97457a31a30d1cc2b2edecd41bb485c9264b6bbfdf7f3d97d92c5778674b4a'
            '0d9510b6afe453291bc7fecc863b17d15d9b7931c5c55e22b55b93ba6195ff70')
b2sums=('79f22d80f7482d8b27fe22690fe675e4c9ac2f0ce037b8ceb7e034f83042446e3b3d3c4ad8567b1609f8bfe2206b2d9474de4ed22249b3d91c29d6ef4c70ff2f'
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
