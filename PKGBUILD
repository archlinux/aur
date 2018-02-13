# Maintainer: Giancarlo Razzolini <grazzolini@archlinux.org>
# Contributor: Kazuo Teramoto <kaz.rag at gmail.com>
pkgname=afew-git
pkgver=1.0.0.r21.g6f4244e
pkgrel=2
epoch=1
pkgdesc="afew is an initial tagging script for notmuch mail"
arch=(any)
url="https://github.com/teythoon/afew"
license=('custom:BSD')
depends=('python' 'notmuch' 'dbacl' 'python-chardet' 'python-setuptools' 'python-dkim')
makedepends=('git' 'python-sphinx')
source=('LICENSE' 'git://github.com/teythoon/afew.git')
md5sums=('295b245540aa61538f9a3556c4be846c'
         'SKIP')

pkgver() {
  cd "$srcdir/afew"

  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/afew"

  python setup.py build

  make -C docs man
}

package() {
  cd "$srcdir/afew"

  python setup.py install --root="$pkgdir" --optimize=1

  install -D -m 644 docs/build/man/afew.1 "$pkgdir/usr/share/man/man1/afew.1"

  install -D -m644 "$srcdir/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
