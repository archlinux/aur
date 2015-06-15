# Maintainer: Kazuo Teramoto <kaz.rag at gmail.com>
pkgname=afew-git
pkgver=0.203.d5d0dde
pkgrel=1
epoch=1
pkgdesc="afew is an initial tagging script for notmuch mail"
arch=(any)
url="https://github.com/teythoon/afew"
license=('custom:BSD')
depends=('python' 'notmuch' 'dbacl' 'python-chardet' 'python-setuptools')
makedepends=('git')
source=('LICENSE' 'git://github.com/teythoon/afew.git')
md5sums=('295b245540aa61538f9a3556c4be846c' 'SKIP')

pkgver() {
  cd "$srcdir/afew"

  echo "0.$(git rev-list --count HEAD).$(git describe --always)"
}

build() {
  cd "$srcdir/afew"

  python setup.py build
}

package() {
  cd "$srcdir/afew"

  python setup.py install --root="$pkgdir" --optimize=1

  install -D -m644 "$srcdir/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
