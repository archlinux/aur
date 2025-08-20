# Maintainer: Matt Robinson <aur@nerdoftheherd.com>
# Contributor: Jaan Toots <jaan@jaantoots.org>
pkgname=goobook
pkgver=3.5.3
pkgrel=1
pkgdesc="Access your Google contacts from the command line"
arch=('any')
url="https://gitlab.com/goobook/goobook"
license=('GPL3')
depends=('python-google-api-python-client'
         'python-google-auth-httplib2'
         'python-google-auth-oauthlib'
         'python-pyparsing'
         'python-pyxdg'
         'python-setuptools'
         'python-simplejson')
makedepends=('python-build'
             'python-docutils'
             'python-installer'
             'python-poetry')
source=("${url}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('8ca19fda0d140ed843815c2aa718f2287223d20307648c57eb00a57a3d9f6c07')

build() {
    cd "$pkgname-$pkgver"
    rst2man --strict goobook.1.rst goobook.1
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 -t "$pkgdir/usr/share/man/man1" "$pkgname.1"
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" "README.rst" "CHANGES.rst"
}
