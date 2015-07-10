# Maintainer: Chris Warrick <aur@chriswarrick.com>
pkgname=pkgbuilder-git
_pyname=pkgbuilder
_gitname=pkgbuilder
pkgver=4.0.1.r1.g90d20a5
pkgrel=1
pkgdesc='A Python AUR helper/library. (git version)'
arch=('any')
url='https://github.com/Kwpolska/pkgbuilder'
license=('BSD')
depends=('python' 'python-setuptools' 'pyalpm>=0.5.1-1' 'python-requests' 'python-srcinfo' 'rsync')
makedepends=('git')
options=(!emptydirs)
provides=('pkgbuilder')
conflicts=('pkgbuilder')
source=("git+https://github.com/Kwpolska/${_gitname}#branch=develop")
md5sums=('SKIP')

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
