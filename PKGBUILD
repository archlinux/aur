# Maintainer:  Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: Laszlo Papp <djszapi at archlinux dot us>

_pkgname=python-parched
pkgname="${_pkgname}-git"
pkgver=0.1.r25.4c3ec3f
pkgrel=3
pkgdesc="A Pacman package and PKGBUILD parser module for Python"
arch=('any')
url="https://github.com/sebnow/parched"
license=('MIT')
depends=('python')
makedepends=('git')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
options=(!emptydirs)
source=("${_pkgname}::git+https://github.com/sebnow/parched.git"
        'LICENSE'
        'parched-assignment.patch')
md5sums=('SKIP'
         '31eccf56949504b5ce33110068948cf2'
         'a3397cfc40ce25f7455360c6481dbeff')


pkgver() {
  cd "${srcdir}/${_pkgname}"

  ver="$(PYTHONPATH=docs python -c 'import conf; print(conf.version)')"
  echo ${ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd "${srcdir}/${_pkgname}"

  patch -p1 -i "${srcdir}/parched-assignment.patch"
}

build() {
  cd "${srcdir}/${_pkgname}"

  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}"

  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm644 "${srcdir}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
