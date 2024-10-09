# Contributor: a821
# Contributor: j605

pkgname=duviz-git
pkgver=3.2.0.r12.g7e30b21
pkgrel=1
pkgdesc='Command line disk space usage visualization utility'
arch=('any')
url="https://github.com/soxofaan/duviz"
license=('MIT')
depends=('python')
makedepends=('git')
checkdepends=('python-pytest')
provides=('duviz')
conflicts=('duviz')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

check() {
  cd "$pkgname"
  pytest
}

package() {
  cd "$pkgname"
  install -Dm755 duviz.py "${pkgdir}/usr/bin/duviz"
  install -Dm644 README.rst CHANGELOG.md -t "${pkgdir}/usr/share/doc/$pkgname"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
