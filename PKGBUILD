# Maintainer: zlsun <zlsun1995@gmail.com>

pkgname=yah3c
pkgver=0.6
pkgrel=1
pkgdesc="A program for h3c authentication in SYSU east campus."
arch=('any')
url="https://github.com/zlsun/yah3c"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/zlsun/yah3c/archive/v${pkgver}.tar.gz"
        "yah3c@.service")
md5sums=("e27b277cc79d9e097a6b398397307437"
         "a49893a03cbe9986a89bb3ebc46b416e")

build ()
{
    cd "$srcdir/${pkgname}-${pkgver}"
    msg 'Building...'
    python setup.py build
}

package ()
{
    cd "$srcdir/${pkgname}-${pkgver}"
    msg 'Installing...'
    python setup.py install --root="$pkgdir" --optimize=1
    cd ..
    msg 'Installing systemd service...'
    install -Dm644 yah3c@.service "${pkgdir}"/usr/lib/systemd/system/yah3c@.service
}
