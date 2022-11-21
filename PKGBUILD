# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Karol 'Kenji Takahashi' Woźniak <kenji.sx>
# Contributor: Tianjiao Yin <ytj000+AUR@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: TDY <tdy@gmx.com>
# Contributor: Tiago Pierezan Camargo <tcamargo@gmail.com>

pkgname=python38-pyflakes
pkgver=2.5.0
pkgrel=1
pkgdesc='A lint-like tool for Python to identify common errors quickly without executing code'
arch=('any')
url='https://pypi.python.org/pypi/pyflakes'
license=('MIT')
depends=('python38')
makedepends=('python38-setuptools')
source=("https://pypi.io/packages/source/p/pyflakes/pyflakes-$pkgver.tar.gz")
sha512sums=('e47303c4b445e0c010dfc96244b6fa991bd1870072c61cc7acd309947af3d81581276b012b56b7db0d8df3f91a4216a5ec502720c149f5707d5d1d28654aeeb4')

build() {
  cd "$srcdir"/pyflakes-$pkgver
  python3.8 setup.py build
}

check() {
  cd "$srcdir"/pyflakes-$pkgver
  python3.8 setup.py test
}

package() {
  cd pyflakes-$pkgver
  python3.8 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1

  # We have python 3 as default python, and want to keep compatibility with the old pyflakes3k naming
  ln -s pyflakes "$pkgdir/usr/bin/pyflakes3k"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
