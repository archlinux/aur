# Maintainer: Raphael Scholer <rascholer@gmail.com>
_pkgname='python-obpm'
pkgname="${_pkgname}-git"
pkgver=2.0_3_g4a66207
pkgrel=2
pkgdesc="Python bindings for creating openbox pipe menus"
arch=('any')
url="http://github.com/rscholer/${_pkgname}"
license=('MIT')
depends=('python')
conflicts=("${_pkgname}")
makedepends=('git' 'python-setuptools')
optdepends=('alsa-utils: for alsa pipe menu'
            'exo: for opening applications'
            'python-moc: for mocp pipe menus'
            'python-pyalsaaudio: for alsa pipe menu'
            'python-setuptools: for running scripts'
)
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  echo "$(git describe --always |sed 's#-#_#g;s#v##')"
}

package() {
  cd "${_pkgname}"
  python setup.py install --prefix="/usr" --root="${pkgdir}" --optimize=2

  install -m 755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" COPYING
}
# vim:set ts=2 sw=2 et:
