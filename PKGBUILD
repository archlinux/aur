# Maintainer: Thiago Kenji Okada <thiago DOT mast3r AT gmail DOT com>

_reponame='burgaur'
pkgname="${_reponame}-git"
pkgver=2.0
pkgrel=1
pkgdesc='A delicious AUR helper. Made from cower.'
arch=('any')
url='https://github.com/m45t3r/burgaur'
license=('MIT')
depends=('cower' 'pacman' 'python' 'python-termcolor' 'sudo')
optdepends=('mc: review packages before installing')
makedepends=('git' 'python-docutils')
install='burgaur.install'
source=("git+${url}")
md5sums=('SKIP')
conflicts=('burgaur')

pkgver() {
  cd "${_reponame}"
  git describe --always | sed 's/-/./g'
}

build() {
  cd "${srcdir}/${_reponame}"
  rst2man README.rst burgaur.1
  gzip -f burgaur.1
}

package() {
  cd "${srcdir}/${_reponame}"
  python setup.py install --root="${pkgdir}/"
  install -Dm644 burgaur.1.gz "${pkgdir}/usr/share/man/man1/burgaur.1.gz"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=8 et sw=2 sts=2
