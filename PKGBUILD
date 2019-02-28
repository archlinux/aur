# Maintainer: Butui Hu <hot123tea123@gmail.com>
# Contributor: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Jean Lucas <jean@4ray.co>
# Based on python-torchvision-git; original contributors:
# Contributor: Stephen Zhang <zsrkmyn at gmail dot com>

pkgname=python-torchvision
pkgver=0.2.2
pkgrel=1
pkgdesc='Datasets, transforms, and models specific to computer vision'
arch=(any)
url=https://pytorch.org
license=(BSD)
depends=(python-numpy python-pillow python-pytorch python-scipy python-six)
makedepends=(python-setuptools)
checkdepends=(python-pytest python-scipy)
source=("torchvision-$pkgver.tar.gz"::"https://github.com/pytorch/vision/archive/v$pkgver.tar.gz")
sha512sums=('36a6bbe133f70a319972bb1798a8f873d53440cc94fc7dc2a7cc2eff67d11bf4de90564c6f3c9f751a1b15fb1fefa2235c95aaf0040984f3c8f5bb8bcd069f57')

build() {
  cd vision-$pkgver
  python setup.py build
}

check() {
  cd vision-$pkgver
  PYTHONPATH=. pytest -v test
}

package() {
  cd vision-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
