# Maintainer: Chris Warrick <aur@chriswarrick.com>
pkgname=upass-git
_pyname=upass
_gitname=upass
pkgver=0.1.2.r1.g83d9e05
pkgrel=1
pkgdesc='Console UI for pass (git version)'
arch=('any')
url='https://github.com/Kwpolska/upass'
license=('BSD')
options=(!emptydirs)
source=("git+https://github.com/Kwpolska/${_gitname}")
md5sums=('SKIP')
depends=('pass' 'python' 'python-setuptools' 'python-urwid' 'python-pyperclip')
makedepends=('git')
provides=('upass')
conflicts=('upass')

prepare() {
  cd "${srcdir}/${_gitname}"
}

package() {
  cd "${srcdir}/${_gitname}"
  python3 setup.py install --root="${pkgdir}/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^v//'
}

# vim:set ts=2 sw=2 et:
