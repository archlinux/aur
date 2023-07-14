# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>

pkgname=pssh-lilydjwg-git
pkgver=2.3.5.r3.gd14d5d0
pkgrel=1
pkgdesc='Parallel SSH Tools'
arch=('any')
license=('custom')
url='https://github.com/lilydjwg/pssh/'
depends=('python')
makedepends=('git' 'python-setuptools')
conflicts=('python-pssh' 'putty')
source=("git+https://github.com/lilydjwg/pssh/")
sha512sums=('SKIP')

pkgver() {
  cd pssh
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
  )
}

build() {
  cd pssh
  python -m build --wheel --no-isolation
}

package() {
  cd pssh
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 COPYING -t "$pkgdir"/usr/share/licenses/$pkgname
}
