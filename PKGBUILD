# Maintainer :  Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)
# Contributor : mickael9 <mickael9 at gmail dot com>


pkgname=wapiti

pkgver=3.0.9
_name="$pkgname${pkgver:0:1}"
pkgrel=1

pkgdesc='Comprehensive web app vulnerability scanner written in Python'
arch=('any')
url="https://$pkgname-scanner.github.io"
license=('GPL')

makedepends=('python-setuptools' 'python-pip')
depends=('python-requests' 'python-beautifulsoup4' 'python-lxml' 'python-yaswfp' 'python-browser-cookie3'
         'python-mako' 'python-python-socks' 'python-tld' 'python-httpx' 'python-httpx-socks'
         'python-aiocache' 'python-sqlalchemy')
optdepends=('python-requests-kerberos: Kerberos authentication'
            'python-requests-ntlm: NTLM authentication')

options=('zipman')

changelog=ChangeLog
source=("https://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname/$pkgname-$pkgver/$_name-$pkgver.tar.gz")
sha256sums=('bd64674b9152057bf1534ca7d7aab8cad4fccb1027813e0d0281f48823a82475')


prepare() { rm -rf "$_name-$pkgver/tests"; }

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  PYTHONHASHSEED=0 python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
