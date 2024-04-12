# Maintainer: coldBug <coldbug@e.mail.de>

pkgname=python-bloodhound-ce-git
_pkgname=bloodhound
pkgver=1.7.2.093be56
pkgrel=1
pkgdesc="Python based ingestor for BloodHoundCE, based on Impacket"
arch=('any')
url="https://github.com/dirkjanm/BloodHound.py"
license=('MIT')
groups=()
depends=('python' 'impacket' 'python-ldap3' 'python-dnspython' 'python-future' 'python-pyasn1')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel')
conflicts=('python-bloodhound')
source=("$pkgname::git+$url#branch=bloodhound-ce")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  version=$(grep -oP "version='\K[0-9]+\.[0-9]+\.[0-9]+(?=')" setup.py)
  commit=$(git rev-parse --short HEAD | sed 's/\([^-]*-g\)/r\1/;s/-/./g')
  printf "%s.%s" $version "$commit"
}

build() {
  cd "$pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
