# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Daniel Langbein < daniel [ at ] systemli [ dot ] org >
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname='python2-mako'
_name='Mako'
pkgver=1.1.6
pkgrel=1
pkgdesc='A fast templating language that borrows the best ideas from other templating languages'
arch=('any')
url="https://pypi.org/project/${_name}/${pkgver}/"
license=('MIT')
depends=(
  'python2-beaker'
  'python2-markupsafe'
)
makedepends=(
  'python2-setuptools'
)
_tarname="${_name}-${pkgver}"
source=("https://pypi.python.org/packages/source/${_name::1}/${_name}/${_tarname}.tar.gz"{,.asc})
b2sums=('bbdf0db9303f5d369b5c6c6644ee44d767630f51305ae259c44c65a3fba959a07d9833fdc69fc8168f7424cc0c3a05e991daae239bef8392c01396c1295967c7'
        'SKIP')
validpgpkeys=('83AF7ACE251C13E6BB7DEFBD330239C1C4DAFEE1')  # Michael Bayer

build() {
  cd "${_tarname}"
  python2 setup.py build
}

package() {
  cd "${_tarname}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"

  mv "${pkgdir}/usr/bin/mako-render"{,2}
}
