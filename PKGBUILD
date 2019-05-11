# Maintainer: Maxime "pep" Buquet <archlinux@bouah.net>

_pkgbase='gtimelog'
pkgname=gtimelog-collabora-git
pkgver=r337.a89bd65
pkgrel=1
pkgdesc="A time tracking application: Collabora repository."
provides=('gtimelog')
arch=('any')
url="https://git.collabora.co.uk/cgit/gtimelog.git"
license=('GPL2')
depends=(
  'libsoup'
  'python2'
  'python2-gobject'
  'python2-setuptools'
  'python2-gnomekeyring')
makedepends=('git' 'python2' 'python2-setuptools')
source=(
  "$_pkgbase::git+https://gitlab.collabora.com/collabora/gtimelog.git"
  "0001-Fix-shebang-to-usr-bin-env-python2.patch"
)

pkgver() {
  cd "$srcdir/$_pkgbase"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgbase"
  patch -p1 < ../0001-Fix-shebang-to-usr-bin-env-python2.patch
}

build() {
  cd "$srcdir/$_pkgbase"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_pkgbase"
  python2 setup.py install --root="$pkgdir/"
}

sha256sums=('SKIP'
            '2e25cb2425efdd1dad70bec06090fcd629af170f2e001b70d1bab94f8732d680')
