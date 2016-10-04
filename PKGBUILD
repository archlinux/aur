# $Id: PKGBUILD 189446 2016-09-16 07:04:36Z felixonmars $
# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python2-v4l2capture
pkgname=('python2-v4l2capture')
pkgver=12.0.0
pkgrel=1
pkgdesc="Capture video with video4linux2"
arch=('i686' 'x86_64')
license=('custom')
url="https://launchpad.net/python-v4l2-capture"
makedepends=('python2-setuptools')
depends=('python2' 'v4l-utils')
source=("https://pypi.python.org/packages/59/33/dbf42b3ce4857923c496c5338df1acd388982977ddfbcda02dcb949cfcfb/v4l2capture-12.tar.gz")
md5sums=('0f6240665573698cda01f17d8194f732')

prepare() {
  cd "$srcdir"/v4l2capture-12
  sed '/^Introduction/,$d' README > LICENSE
}

build() {
  cd "$srcdir"/v4l2capture-12
  python2 setup.py build
}

package() {
  cd v4l2capture-12
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
