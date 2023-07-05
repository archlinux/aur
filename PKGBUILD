# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=slidgnal-git
pkgver=r4.a5d9afa
pkgrel=2
pkgdesc='Feature-rich Signal to XMPP puppeteering gateway, based on slidge'
arch=('x86_64' 'armv7h' 'aarch64')
url="https://git.sr.ht/~nicoco/slidgnal"
license=('AGPL3')
depends=('python' 'python-slidge' 'python-emoji' 'python-aiosignald')
makedepends=('git' 'python-build' 'python-wheel' 'python-installer' 'python-setuptools')
provides=('slidgnal')
conflicts=('slidgnal')
source=('git+https://git.sr.ht/~nicoco/slidgnal')
sha256sums=('SKIP')

pkgver() {
  cd slidgnal
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd slidgnal
  python -m build --wheel --no-isolation
}

package() {
  cd slidgnal
  python -m installer --destdir="$pkgdir" dist/*.whl
}
