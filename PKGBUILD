# Maintainer: Michael Polidori <michaelapolidori at gmail dot com>
# Author: Pascal van Kooten <kootenpv at gmail dot com>

pkgname=python-yagmail-git
_name=yagmail
pkgver=r214.5f5f6c9
pkgrel=1
pkgdesc="Yet Another GMAIL/SMTP client, written in Python."
arch=(any)
url="https://github.com/kootenpv/yagmail.git"
license=(MIT)
depends=("python")
optdepends=("python-keyring")
source=("git+$url")
md5sums=(SKIP)

pkgver() {
  cd "$_name"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "$srcdir/$_name"
  python setup.py install --root="${pkgdir}"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
