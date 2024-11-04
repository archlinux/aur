# Maintainer: Younes "khoyo" Khoudli <khoyobegenn@gmail.com>
# Contributor: Maxime "pep" Buquet <archlinux@bouah.net>

_pkgname=git-pw
_tag=2.7.0
pkgname=${_pkgname}
pkgver=${_tag}
pkgrel=1
pkgdesc="A tool for integrating Git with Patchwork, the web-based patch tracking system"
url='https://github.com/getpatchwork/git-pw'
license=('MIT')
arch=('any')
depends=(
  'git'
  'python'
  'python-requests'
  'python-click'
  'python-pbr'
  'python-arrow'
  'python-tabulate'
  'python-yaml'
)
makedepends=('python-setuptools' 'python-build' 'python-wheel' 'python-installer')
source=("${_pkgname}::git+https://github.com/getpatchwork/git-pw.git#tag=${_tag}")
sha256sums=('SKIP')

build() {
  cd ${srcdir}/${_pkgname}
  python -m build --wheel --no-isolation
}

package() {
  cd ${srcdir}/${_pkgname}
  python -m installer --destdir="${pkgdir}" dist/git_pw-${_tag}-py3-none-any.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  mkdir -p "${pkgdir}/usr/share/man/man1"
  install -Dm644 man/*.1 "${pkgdir}/usr/share/man/man1/"
}
