# Maintainer: Jaan Toots <jaan@jaantoots.org>
pkgname=goobook
pkgver=3.5.1
pkgrel=1
pkgdesc="Access your Google contacts from the command line"
arch=('any')
url="https://gitlab.com/goobook/goobook"
license=('GPL3')
depends=('python-google-api-python-client'
         'python-simplejson'
         'python-oauth2client'
         'python-xdg>=4.0.1')
makedepends=('python-setuptools' 'python-docutils')
source=("${url}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('235df73635bba6d51e80215cb50d260ae0f5fc17ccef1d00a13826085e9b794d')

build() {
    cd "$pkgname-$pkgver"
    rst2man.py --strict goobook.1.rst goobook.1
    python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 -t "$pkgdir/usr/share/man/man1" "$pkgname.1"
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" "README.rst" "CHANGES.rst"
}
