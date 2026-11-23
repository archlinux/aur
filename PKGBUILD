# Maintainer: coldBug <coldbug@e.mail.de>

pkgname=python-bloodhound-ce-git
_pkgname=bloodhound
pkgver=1.9.1.r345.gf7c0144
pkgrel=1
pkgdesc="Python based ingestor for BloodHoundCE, based on Impacket"
arch=('any')
url="https://github.com/dirkjanm/BloodHound.py"
license=('MIT')
groups=()
depends=('python' 'impacket' 'python-ldap3' 'python-ldap3-ad-auth' 'python-dnspython' 'python-pyasn1' 'python-pycryptodome')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
provides=('python-bloodhound-ce')
conflicts=('python-bloodhound-ce' 'python-bloodhound')
source=("$pkgname::git+$url#branch=bloodhound-ce")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  local version
  version=$(grep -oP "version='\K[0-9]+\.[0-9]+\.[0-9]+(?=')" setup.py)
  printf "%s.r%s.g%s" "$version" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
