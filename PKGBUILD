# Maintainer : Yigit Sever <yigit at yigitsever dot com>
# Contributor :  Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)
# Contributor : mickael9 <mickael9 at gmail dot com>

pkgname=wapiti
pkgver=3.1.6
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
sha512sums=('8017d88c35a232f20f97297f5955154bead777a1b3d3937d29e6a39d2eeb5167764aa81286bfca5b9d200a29c25a6173052ddd8cbfebc1cb18aa84c0e2bb0e22')

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
