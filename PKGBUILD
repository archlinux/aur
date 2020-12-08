# Maintainer: Bennett Piater <bennett at piater dot name>

pkgname=gpgsync
pkgver=0.3.5
pkgrel=2
pkgdesc="A tool to let users always have up-to-date public keys for other members of their organization."
arch=('any')
url="https://github.com/firstlookmedia/gpgsync/"
license=('GPL3')
depends=('python-setuptools' 'python-pyqt5' 'python-nose' 'python-requests' 'python-pysocks' 'python-packaging' 'python-dateutil' 'gnupg')
source=("$pkgname-$pkgver.tar.gz::https://github.com/firstlookmedia/${pkgname}/archive/v${pkgver}.tar.gz" gpgsync.{service,timer})
sha512sums=('cb0a634006f200bbdb3104a3a2efd290e7bb4f56800d2d63dc56676a35360182ce10d7c6a5d84a4e6c45ec4dc7ce8216c9ccc526229f1c8176384c9344ab30e9'
            '26a56775912d680ce34c32c5e24a3dd5826b3ea78c6c3d4295d8da199d881b30c200631fd0a49077c3b4617e4941cbcd57a342e535939ea04fe4e489f15f9d18'
            'f4d02c8d001d42db99e1cbc746b92ef41b15c13a3c3ad3e972f570d67f8f4d31b87ba7ee9440fcae190b38ee32d1f46f835a93c845cd6ac982aaea441f1ae8a9')

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

package() {
  install -Dm644 -t "$pkgdir/usr/lib/systemd/user" gpgsync.{service,timer}
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et
