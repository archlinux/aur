# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>

pkgname=seqdiag
pkgver=3.1.0
pkgrel=1
pkgdesc="Sequence-diagram images from .diag files"
arch=('any')
url="https://github.com/blockdiag/seqdiag"
license=('Apache-2.0')
depends=('blockdiag')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-docutils' 'python-pytest' 'python-pycodestyle' 'python-reportlab')
optdepends=('python-reportlab: for PDF export'
            'python-docutils: for RST parser')
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/arenevier/seqdiag/archive/v$pkgver.tar.gz"
)
sha512sums=('68a65dd47eb87032eb7f2a0b927669762565d5f8813a68eff2bc29cc1e844492203879ea4cbb4edcde9325094b7261e8a416df906068214e0d87d126d69124a5')

build() {
  cd seqdiag-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd seqdiag-$pkgver
  PYTHONDONTWRITEBYTECODE=1 pytest
}

package() {
  cd seqdiag-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {CHANGES,README}.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -vDm 644 "${pkgname}.1" -t "${pkgdir}/usr/share/man/man1/"
}
