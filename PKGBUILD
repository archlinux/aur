# Maintainer: Maxime "pep" Buquet <archlinux@bouah.net>

_pkgname=git-pw
pkgname=${_pkgname}-git
pkgver=2.0.0.r0.g613df41
pkgrel=1
pkgdesc="A tool for integrating Git with Patchwork, the web-based patch tracking system"
url='https://github.com/getpatchwork/git-pw'
license=('MIT')
arch=('any')
depends=(
  'git'
  'python-requests'
  'python-click'
  'python-pbr'
  'python-arrow'
  'python-tabulate'
)
makedepends=('python-setuptools')
source=("${_pkgname}::git+https://github.com/getpatchwork/git-pw.git")
sha256sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd ${_pkgname}
  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  mkdir -p "${pkgdir}/usr/share/man/man1"
  install -Dm644 man/*.1 "${pkgdir}/usr/share/man/man1/"
}
