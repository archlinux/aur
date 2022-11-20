# Maintainer: Sébastien Luttringer

pkgname=python38-psutil
pkgver=5.9.4
pkgrel=1
arch=('x86_64')
pkgdesc='A cross-platform process and system utilities module for Python'
url='https://github.com/giampaolo/psutil'
license=('custom: BSD')
depends=('python38')
makedepends=('python38-setuptools')
checkdepends=('net-tools' 'procps-ng' 'python38-pytest')
source=("https://github.com/giampaolo/psutil/archive/release-$pkgver.tar.gz")
sha512sums=('ea131f301e1464bde52493910631d3cb3c8ac6a8456c19218c24433d94c11eada1cb553496838ba42eff0d6ea2ed8be68115261439fdf6ea4a642fa3fc18dc1c')

build() {
  cd psutil-release-$pkgver

  python3.8 setup.py build --build-lib=build/python3.8
}

check() {
  cd psutil-release-$pkgver

  # Required for testing
#cp setup.py build/python3.8
#cp -r scripts build/python3.8/

# 4 non-working tests in build chroot, requires fixes. Test framework does not allow exclusion.
#  PYTHONPATH="$PWD/build/python" python3.8 psutil/tests/__main__.py
}

package() {
  cd psutil-release-$pkgver
  python3.8 setup.py build --build-lib=build/python3.8 \
                  install --root="$pkgdir" --optimize=1
  install -D -m 644 LICENSE "$pkgdir/"usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
