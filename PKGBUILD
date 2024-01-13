# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-behave
pkgver=1.2.7.dev3
pkgrel=1
pkgdesc="Behaviour-driven development, Python style"
url="https://github.com/behave/behave"
license=('BSD')
arch=('any')
depends=('python-cucumber-tag-expressions' 'python-parse' 'python-parse-type' 'python-six'
         'python-colorama')
makedepends=('python-setuptools')
checkdepends=('python-path' 'python-pyhamcrest' 'python-pytest' 'python-pytest-html')
source=("https://github.com/behave/behave/archive/v$pkgver/$pkgname-$pkgver.tar.gz" "unittest-mock.patch")
sha512sums=('c12f2bb7ffc0dbca7590e711f30927dc907cd124c75c2791a9a6cb9650a51e08cb5ece05326d200a299282ca8a8d98783a8c7964321b882c9e6b6bb8b7a144a4'
            '999f45f2bd2f6010926cde07a71582ab8e533aeb8edd32401db7ad8c6f9245c33203415151f642ab2b78c4d2dac2050edeb94eeed2075f0de85e5135cc376bcd')

prepare() {
  cd behave-$pkgver
  patch -Np1 -i ${srcdir}/unittest-mock.patch
}

build() {
  cd behave-$pkgver
  python setup.py build
}

check() {
  cd behave-$pkgver
  pytest
}

package() {
  cd behave-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
