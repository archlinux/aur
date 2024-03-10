# Maintainer: fossdd <fossdd@pwned.life>
# Contributor: kpcyrd <kpcyrd[at]archlinux[dot]org>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Sam S. <smls75@gmail.com>
# Contributor: Nuno Araujo <nuno.araujo@russo79.com>

pkgname=pmbootstrap-systemd-git
_pkgname=${pkgname%-systemd-git}
pkgver=2.2.1.r38.g5da5a93a
pkgrel=1
pkgdesc='Sophisticated chroot/build/flash tool to develop and install postmarketOS (systemd branch)'
url='https://gitlab.com/postmarketOS/pmbootstrap'
arch=('any')
license=('GPL-3.0-only')
provides=($_pkgname)
conflicts=($_pkgname)
depends=(
  'python'
  'python-argcomplete'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=("git+https://gitlab.com/postmarketOS/pmbootstrap.git#branch=systemd")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_pkgname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}

# vim: ts=2 sw=2 et:
