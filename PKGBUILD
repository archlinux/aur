# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>

pkgname=awslogs
pkgver=0.14.0
pkgrel=2
pkgdesc="AWS CloudWatch logs for Humans™"
arch=('any')
license=('Apache')
url="https://github.com/jorgebastida/awslogs"
depends=('python>=3'
         'python-boto3>=1.5.0'
         'python-jmespath>=0.7.1' 'python-jmespath<1.0.0'
         'python-termcolor>=1.1.0'
         'python-dateutil>=2.4.0')
makedepends=('python-wheel')
source=("https://github.com/jorgebastida/${pkgname}/archive/${pkgver}.tar.gz"
        'exclude-tests.patch')
sha512sums=('73f7d4e983b0a1658027aa88174ced0d2760823463c67832303be72b174ecdfbf6aabd73342634e233afd7736c57d397b55f0db89d0c59392145062de8868241'
            'ee96370c27a866ac503e498f0b2bdbe292633431343a2f458c3547d854f856e46e35af5dada4e757a7cfdf6790f9e5075a4ffd96622507e591e7c6edf7db73a9')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Nfp1 < "$srcdir/exclude-tests.patch"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
