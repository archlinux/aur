# Maintainer: Maxim Andersson <thesilentboatman@gmail.com>

pkgname=zget-git
_gitname=zget
pkgver=0.11.1.r15.g7116e03
pkgrel=1
pkgdesc="Zeroconf based peer to peer file transfer"
arch=('any')
url="https://github.com/nils-werner/zget"
license=('MIT')
depends=('python' 'python-netifaces' 'python-progressbar2' 'python-requests' 'python-zeroconf')
makedepends=('git' 'python-setuptools')
provides=('zget')
conflicts=('zget')
source=('git://github.com/nils-werner/zget.git')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_gitname}"

  # Remove unneeded limitations (on Arch)
  sed -i 's/<......//' setup.py
}

package() {
  cd "${srcdir}/${_gitname}"

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_gitname}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
