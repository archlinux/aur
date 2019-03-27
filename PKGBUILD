# Maintainer: Viliam Pucik <viliam.pucik@protonmail.com>
# Contributor: Viliam Pucik <viliam.pucik@protonmail.com>

pkgbase=python-aws-mfa
pkgname=('python-aws-mfa' 'python2-aws-mfa')
pkgver=0.0.12
pkgrel=1
pkgdesc='Easily manage your AWS Security Credentials when using Multi-Factor Authentication (MFA)'
arch=('any')
license=('Apache')
url='https://github.com/broamski/aws-mfa'
makedepends=('python-setuptools' 'python2-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/broamski/aws-mfa/archive/$pkgver.tar.gz")
sha512sums=('6ea93dc93d2ebdfb6adbbe9c2a4571781a64381aff6b429456ecd9378329857c34eaa98c20f6928aaebdd4410d0c4f69b3b9d1f68429128d7198756e95398663')

prepare() {
  cp -r "aws-mfa-$pkgver" "python-aws-mfa-$pkgver"
  cp -r "aws-mfa-$pkgver" "python2-aws-mfa-$pkgver"
}

build() {
  cd "$srcdir/python-aws-mfa-$pkgver"
  python setup.py build

  cd "$srcdir/python2-aws-mfa-$pkgver"
  python2 setup.py build
}

check() {
  cd "$srcdir"/aws-mfa-$pkgver
}

package_python-aws-mfa() {
  depends=('python-boto3')
  cd "$srcdir/python-aws-mfa-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}

package_python2-aws-mfa() {
  depends=('python2-boto3')
  cd "$srcdir/python2-aws-mfa-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1
}
