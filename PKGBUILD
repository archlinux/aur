# Maintainer: Gildásio Júnior <gildasiojunior @at@ riseup .dot. net>

# shellcheck -s bash -e SC2164 PKGBUILD

pkgname=subcat-git
_pkgname=${pkgname%-git}
pkgver=r28.1b3d015
pkgrel=1
pkgdesc="Lightning-fast passive subdomain discovery tool for security professionals and bug bounty hunters"
arch=(any)
url="https://github.com/duty1g/subcat"
license=(MIT)
conflicts=()
provides=(subcat)
depends=(
  python
  python-requests
  python-yaml
  python-urllib3
)
makedepends=(
    git
    python-setuptools
)
source=("git+https://github.com/duty1g/subcat")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  python setup.py build
}

package() {
  cd "$_pkgname"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
