# Maintainer: Nikolay Korotkiy <sikmir@gmail.com>
pkgname=pyglossary
pkgver=3.0.4
pkgrel=4
pkgdesc="A tool for converting dictionary files aka glossaries with various formats for different dictionary applications"
arch=(any)
url="https://github.com/ilius/pyglossary"
license=('GPL3')
depends=('python-gobject' 'tix')
provides=("${pkgname}=${pkgver}")
conflicts=(${pkgname}-git)
source=("https://github.com/ilius/${pkgname}/archive/${pkgver}.tar.gz"
        "core.patch"
        "setup.patch")
sha256sums=('be0c88987ca4791a858271a7c9acdbd6a680e4fdc61ddc6ad2d06b090a1bdc6e'
            'fdbced72734b48587ed606acf9b8fe425783cd9a81d798f58920921be16616e0'
            'bb01e54cb596b0a4ceb43a53900cb9c2f20e662fd1e02ee6f516196de77ae18a')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np1 < ../core.patch
  patch -Np1 < ../setup.patch
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
  mkdir -p $pkgdir/usr/bin
  ln -s /usr/share/pyglossary/pyglossary.pyw $pkgdir/usr/bin/pyglossary
  cp config.json $pkgdir/usr/share/pyglossary
}

# vim:set ts=2 sw=2 et:
