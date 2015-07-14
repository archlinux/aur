# Maintainer: Nidhogg
pkgname='python2-fusepy-git'
pkgver=v2.0.2.r1.g27d76e4
pkgrel=1
pkgdesc='Simple ctypes bindings for FUSE'
arch=('any')
license=('custom:ISCL')
url='https://github.com/terencehonles/fusepy'
depends=('fuse>=2.6' 'python2')
makedepends=('python2-setuptools')
conflicts=('python2-fuse')
source=('git://github.com/terencehonles/fusepy.git')
md5sums=('SKIP')

pkgver() {
  cd fusepy
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/fusepy"
  python2 setup.py install --root="$pkgdir/" --optimize=1

  sed -n '/Copyright/,/ THIS SOFTWARE[.]/p' fuse.py > LICENSE
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
