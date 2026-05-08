# Maintainer: kmille aur@androidloves.me

pkgname=git-dumper-git
_pkgname=git-dumper
pkgver=1.0.8.r3.g29b043f
pkgrel=1
pkgdesc="A tool to dump a git repository from a website"
arch=('any')
url="https://github.com/arthaud/git-dumper"
license=('MIT')
makedepends=(git python-setuptools python-pip)
depends=(python python-pysocks python-requests python-beautifulsoup4 python-dulwich python-requests-pkcs12)
source=(git+https://github.com/arthaud/git-dumper)
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "$srcdir/$_pkgname"
  python -m pip install --root="$pkgdir" .
}
