# Maintainer: Yuanji <self@gimo.me>
# Contributor: Bhanupong Petchlert <bpetlert@gmail.com>

pkgname=howdoi-git
_pkgname="howdoi"
pkgver=1.1.14.329.807894b
pkgrel=1
pkgdesc="Instant coding answers via the command line."
arch=(any)
url="https://github.com/gleitz/howdoi"
license=('MIT')
depends=(
  'python'
  'python-cssselect'
  'python-lxml'
  'python-pyquery'
  'python-requests'
  'python-requests-cache'
  'python-pygments'
)
makedepends=('git')
conflicts=('python2-howdoi' 'howdoi')
source=("${_pkgname}::git+https://github.com/gleitz/howdoi.git#branch=master")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgname}"
  _releasever=$(head -n1 CHANGES.txt)
  revision="$(git rev-list --count HEAD)"
  changeset="$(git log -1 --pretty=format:%h)"
  echo "${_releasever}.${revision}.${changeset}"
}

package() {
  cd "$srcdir/${_pkgname}"
  python setup.py install --root=$pkgdir --optimize=1
}
