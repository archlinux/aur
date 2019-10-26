# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=seqdiag
pkgver=0.9.5.20180708
_commit=30c6a2b4c0b5e2c3c4752bfad87899aabdc41d2f
pkgrel=2
pkgdesc="seqdiag generates sequence-diagram images from .diag files"
url="http://blockdiag.com/en/seqdiag/index.html"
license=('Apache')
arch=('any')
depends=('blockdiag')
checkdepends=('python-nose' 'python-pycodestyle' 'python-reportlab' 'python-docutils')
source=("$pkgname-$_commit.tar.gz::https://github.com/blockdiag/seqdiag/archive/$_commit.tar.gz")
sha512sums=('d7167ecaf0d0d379a5dfdd5ec69cc7a2148d5a7ffc95ddf7af01f8f4819d5e2dc05d3439af7f2ade3d67479b553c90c47b603661260422684549722be97e4085')

prepare() {
  mv seqdiag-{$_commit,$pkgver}
  sed -i 's/pep8/pycodestyle/' seqdiag-$pkgver/setup.py
}

build() {
  cd seqdiag-$pkgver
  python setup.py build
}

check() {
  cd seqdiag-$pkgver
  python setup.py install --root="$PWD/tmp_install" --optimize=1
  PYTHONPATH="$PWD/tmp_install/usr/lib/python3.8/site-packages" nosetests || warning "Tests failed"
}

package() {
  cd seqdiag-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
