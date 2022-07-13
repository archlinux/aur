# Maintainer : Yigit Sever <yigit at yigitsever dot com>
# Contributor :  Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)
# Contributor : mickael9 <mickael9 at gmail dot com>

pkgname=wapiti
pkgver=3.1.3
_name="$pkgname${pkgver:0:1}"
pkgrel=1
pkgdesc='Comprehensive web app vulnerability scanner written in Python'
arch=('any')
url="https://$pkgname-scanner.github.io"
license=('GPL')
makedepends=('python-setuptools')
depends=('python' 'python-requests' 'python-beautifulsoup4' 'python-lxml' 'python-yaswfp'
         'python-browser-cookie3' 'python-mako' 'python-python-socks' 'python-tld' 'python-httpx'
         'python-aiocache' 'python-aiosqlite' 'python-sqlalchemy' 'python-loguru' 'python-cryptography')
optdepends=('python-requests-kerberos: Kerberos authentication'
            'python-requests-ntlm: NTLM authentication')
options=('zipman')
changelog=ChangeLog
source=("https://github.com/$pkgname-scanner/$pkgname/releases/download/$pkgver/$_name-$pkgver.tar.gz")
sha256sums=('83ffef39199f92f530f7de7b47dbfb93ab2c9c97d3bbee93473084cba5796c61')

prepare() {
  rm -rf "$_name-$pkgver/tests"
}

build() {
  cd "$_name-$pkgver"
  sed -i '/mitmproxy==8.0.0/s/==8.0.0/>=8.0.0/' setup.py
  sed -i '/dnspython==2.1.0/s/==2.1.0/>=2.1.0/' setup.py
  sed -i '/cryptography==36.0.2/s/==36.0.2/>=36.0.2/' setup.py
  sed -i '/browser-cookie3==0.11.4/s/==0.11.4/>=0.11.4/' setup.py
  sed -i '/importlib_metadata==3.7.2/s/==3.7.2/>=3.7.2/' setup.py
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  PYTHONHASHSEED=0 python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
