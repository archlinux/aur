# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

pkgname='python2-pytest-expect'
_name="${pkgname#python2-}"
pkgver=1.1.0
pkgrel=7
pkgdesc='A Python 2 pytest plugin to store test expectations and mark tests based on them'
arch=('any')
url="https://pypi.org/project/${_name}/${pkgver}/"
license=('MIT')
depends=(
  'python2-pytest'
  'python2-u-msgpack'
)
makedepends=('python2-setuptools')
_tarname="${_name}-${pkgver}"
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_tarname}.tar.gz"
        'LICENSE')
sha256sums=('36b4462704450798197d090809a05f4e13649d9cba9acdc557ce9517da1fd847'
            '49b00bf423506a1ac5c1c47df6b6458c01b5e785d9a91d4f57e78fe5d344f1b8')

build() {
  cd "${_tarname}"
  python2 setup.py build
}

package() {
  cd "${_tarname}"
  python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 '../LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
