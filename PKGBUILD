# Maintainer: Jaakko Sirén <jaakko.siren@pm.me>
_pkgname=python-pykerberos
pkgname=$_pkgname-git
pkgver=1.2.1.r7.g293be8f
pkgrel=1
pkgdesc="High-level interface to Kerberos"
arch=('x86_64')
license=('Apache')
url="https://github.com/02strich/pykerberos"
depends=('python' 'krb5')
makedepends=('python-setuptools')
provides=('python-pykerberos')
conflicts=('python-pykerberos')
source=(
  "$_pkgname::git+https://github.com/02strich/pykerberos.git"
)
md5sums=('SKIP')

pkgver(){
  cd "$srcdir/$_pkgname"
  git describe --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build(){
  cd "$_pkgname"
  python setup.py build
}

package(){
  cd "$_pkgname"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
