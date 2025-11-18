# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: mutantmonkey <aur@mutantmonkey.mx>
# Contributor: Kyle Sferrazza <kyle.sferrazza@gmail.com>
# Contributor: Dimitrios Vogiatzis <me@dimtree.net>
pkgname=python-plexapi-girens
pkgver=3.0.6+559+gcadb3d2
pkgrel=3
pkgdesc="Python bindings for the Plex API."
arch=('any')
url="https://github.com/tijder/python-plexapi"
license=('BSD-3-Clause')
depends=(
  'python-requests'
  'python-tqdm'
  'python-websocket-client'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
provides=('python-plexapi')
conflicts=('python-plexapi')
_commit=cadb3d2a399702ae3908cad70e52e439d9b665a2  # branch/master
source=("git+https://github.com/tijder/python-plexapi.git#commit=${_commit}")
sha256sums=('8da661f11a423b133a18bfff5cd1e5965f04794550b733cc929d3ea170c5cdf7')

pkgver() {
  cd python-plexapi
  git describe --tags --abbrev=7 | sed 's/-/+/g'
}

prepare() {
  git -C python-plexapi clean -dfx
}

build() {
  cd python-plexapi
  python -m build --wheel --no-isolation
}

package() {
  cd python-plexapi
  python -m installer --destdir="$pkgdir" dist/*.whl
}
