# Maintainer: Nikita Puzyryov <nekit1234007@gmail.com>
pkgname=gixy-git
pkgver=0.1.20
pkgrel=1
pkgdesc="Nginx configuration static analyzer"
arch=(any)
url="https://github.com/yandex/gixy"
license=('MPL')
depends=('python' 'python-six' 'python-pyparsing' 'python-cached-property' 'python-argparse' 'python-jinja' 'python-configargparse')
provides=(gixy)
conflicts=(gixy)
options=(!emptydirs)
source=($pkgname::git+$url)
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  ( set -o pipefail
    git describe --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "$srcdir/$pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
