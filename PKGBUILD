# Maintainer: Daniel Langbein < daniel [ at ] systemli [ dot ] org >
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python2-mako
pkgver=1.1.5
pkgrel=1
pkgdesc="A super-fast templating language that borrows the best ideas from the existing templating languages"
arch=('any')
url="https://www.makotemplates.org/"
license=('MIT')
makedepends=('python2-setuptools')
depends=('python2-markupsafe' 'python2-beaker' 'python2-setuptools')

source=("https://pypi.io/packages/source/M/Mako/Mako-$pkgver.tar.gz"{,.asc})
sha512sums=('3eff75f1a94f8e01131ce118df73be1ade79306562ae2ca68079eb2b64ef82c48c09cfd7ed6eda42819bf50c70941cf4115f8918b4d8187f7489717c7d4a423b'
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
