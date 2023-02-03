# Maintainer: Ondřej Hošek <ondra.hosek@gmail.com>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

_gitrepo='python-nbxmpp'
pkgname='python-nbxmpp-git'
pkgver=4.1.0.r4.g345fbe0
pkgrel=1
pkgdesc="Nonblocking Jabber/XMPP library, used by Gajim"
arch=('any')
url="https://dev.gajim.org/gajim/python-nbxmpp"
license=('GPL3')
makedepends=('git' 'python' 'python-build' 'python-installer' 'python-wheel')
depends=('python' 'python-precis_i18n' 'python-gobject' 'python-pyopenssl')
conflicts=('python-nbxmpp')
provides=("python-nbxmpp=$pkgver")
source=("git+https://dev.gajim.org/gajim/$_gitrepo.git")
sha384sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitrepo"
  git describe --tags --long | sed 's/^nbxmpp-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_gitrepo"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_gitrepo"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
