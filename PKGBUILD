# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python2-mako
pkgver=1.1.2
pkgrel=3
pkgdesc="A super-fast templating language that borrows the best ideas from the existing templating languages"
arch=('any')
url="https://www.makotemplates.org/"
license=('MIT')
makedepends=('python2-setuptools')
depends=('python2-markupsafe' 'python2-beaker' 'python2-setuptools')

source=("https://pypi.io/packages/source/M/Mako/Mako-$pkgver.tar.gz"{,.asc})
sha512sums=('73b7a32ceb6e39dc2491734546c83a752bf0c8bc7546bb236801c02a5bccc5b59f2440333a328ff747eee936612dd12279f08d27d76f065fd589081d232692a8'
            'SKIP')
validpgpkeys=('83AF7ACE251C13E6BB7DEFBD330239C1C4DAFEE1')  # Michael Bayer

build() {
  cd "$srcdir/Mako-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/Mako-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  mv "$pkgdir"/usr/bin/mako-render{,2}
}
