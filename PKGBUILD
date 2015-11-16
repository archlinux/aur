# Contributor: Mathieu Clabaut <mathieu.clabaut@gmail.com>
# Maintainer: Eric Anderson <ejona86@gmail.com>

pkgname=obnam
pkgver=1.18.1
pkgrel=2
pkgdesc="Easy, secure backup program"
arch=('i686' 'x86_64')
url="http://obnam.org/"
license=('GPL3')
depends=('python2-paramiko' 'python2-tracing' 'python2-larch'
         'python2-ttystatus' 'python2-cliapp' 'python2-yaml')
optdepends=('python2-fuse: support for mounting backups')
source=("http://code.liw.fi/debian/pool/main/o/obnam/obnam_$pkgver.orig.tar.xz"
        'Add-prefetch-size-argument.patch')
sha256sums=('455159a162ce6cddbe7dacc04f94ba3cd9e65c868ea41d3f06b44254da523c7e'
            'f1504e89c6e003cdf40cfbdc5154dafd3f7fd41aa19c4cab7120486c241d5e32')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i -e 's/python/python2/' setup.py
  patch -p1 < "$srcdir/Add-prefetch-size-argument.patch"
  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
