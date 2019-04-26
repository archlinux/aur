# Maintainer: ebiadsu <ebiadsu@posteo.de>

pkgname=python-ovh
pkgver=0.5.0
pkgrel=1
pkgdesc="Official OVH.com API wrapper"
arch=("x86_64")
url="https://api.ovh.com"
license=('custom')
depends=("python")
makedepends=("python-setuptools" "python-sphinx")
source=("https://github.com/ovh/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('169f7481cfb85f140885abe616f9d626421961e83e82810b53f93ae7b6ece368')

build() {
  cd $srcdir/$pkgname-$pkgver
  python setup.py build
  
  # build man pages
  cd docs
  make man
}

package() {
  cd $srcdir/$pkgname-$pkgver
  python setup.py install --root=$pkgdir --skip-build

  # copy man pages into place
  install -d $pkgdir/usr/share/man/man1
  install -Dm644  docs/_build/man/python-ovh.1 $pkgdir/usr/share/man/man1/python-ovh.1

  # install license file
  install -Dm644  LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  # install doc files
  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 CHANGELOG.md "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG"
  install -Dm644 CONTRIBUTING.rst "${pkgdir}/usr/share/doc/${pkgname}/CONTRIBUTING.rst"
  install -Dm644 MANIFEST.in "${pkgdir}/usr/share/doc/${pkgname}/MANIFEST.in"
  install -Dm644 MIGRATION.rst "${pkgdir}/usr/share/doc/${pkgname}/MIGRATION.rst"
  install -Dm644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
}
