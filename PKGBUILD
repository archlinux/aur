# Maintainer: Étienne André <eti.andre@gmail.com>
pkgname='python-fusepy-git'
pkgver=2.0.4.r0.g0eafeb5
pkgrel=1
pkgdesc='Simple ctypes bindings for FUSE'
url='https://github.com/terencehonles/fusepy'
arch=('any')
license=('custom:ISCL')
depends=('fuse>=2.6' 'python')
makedepends=('python-setuptools')
source=('git+https://github.com/terencehonles/fusepy.git')
md5sums=('SKIP')

pkgver() {
  cd fusepy
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/fusepy"
  python setup.py install --root="$pkgdir/" --optimize=1

  sed -n '/Copyright/,/ THIS SOFTWARE[.]/p' fuse.py > LICENSE
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
