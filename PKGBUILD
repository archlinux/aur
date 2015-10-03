# Maintainer: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

pkgname=python-aur
pkgver=0.10.0
pkgrel=2
pkgdesc='Arch User Repository API interface for Python'
arch=('any')
url='https://github.com/cdown/aur'
license=('ISC')
depends=('python-requests' 'python-inflection')
makedepends=('python-setuptools')
source=(https://pypi.python.org/packages/source/a/aur/aur-$pkgver.tar.gz
        aur-0.10-no-popularity-in-v1.patch)
md5sums=('fad8a5a1ff35f30c14a7b75a9258dafb'
         'be8b45c7df9c3596817ff5178e122654')

prepare() {
  cd aur-$pkgver
  patch -p1 -i ../aur-0.10-no-popularity-in-v1.patch
}

package() {
  cd aur-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
