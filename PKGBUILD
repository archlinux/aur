# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: Adrian Sampson <adrian@radbox.org>

pkgname=python-musicbrainzngs-git
pkgver=0.7.1.r20.g1638c62
pkgrel=3
pkgdesc="Python bindings for Musicbrainz' NGS webservice"
arch=('any')
url=https://github.com/alastair/python-musicbrainzngs
license=('BSD-2-Clause' 'ISC')
provides=("${pkgname%-git}=${pkgver%.r*}")
conflicts=("${pkgname%-git}")
makedepends=('git' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=('git+https://github.com/alastair/python-musicbrainzngs.git')
md5sums=('SKIP')

pkgver() {
  cd python-musicbrainzngs
  git describe --tags | sed -e 's/^v//;s/-/.r/;s/-/./g'
}

build() {
  cd python-musicbrainzngs
  python -m build --wheel --no-isolation
}

package() {
  cd python-musicbrainzngs
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 COPYING -t "${pkgdir}"/usr/share/licenses/python-musicbrainzngs/
}

# vim:set ts=2 sw=2 et:
