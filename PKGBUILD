# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

_gitrepo='omemo-dr'
pkgname='python-omemo-dr-git'
pkgver=r2.e297eea
pkgrel=1
pkgdesc="Python port of libsignal-protocol-java originally written by Moxie Marlinspike"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://dev.gajim.org/gajim/omemo-dr"
license=('GPL3')
makedepends=('git' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
depends=('python-cryptography' 'python-protobuf')
conflicts=('python-omemo-dr')
provides=("python-omemo-dr=$pkgver")
source=("git+https://dev.gajim.org/gajim/$_gitrepo.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitrepo"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$srcdir/$_gitrepo"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_gitrepo"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
