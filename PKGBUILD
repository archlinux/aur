# Maintainer: Franck Stauffer <franck.stauffer@monaco.mc>

pkgname=pyidm
pkgver=2020.8.13
pkgrel=1
pkgdesc="Python open source alternative to IDM (Internet Download Manager)"
arch=('any')
url="https://github.com/pyIDM/PyIDM"
license=('LGPL3')
depends=('ffmpeg'
         'python>=3.6' 
         'python-certifi' 
         'python-pillow'
         'python-plyer' 
         'python-pycurl' 
         'python-pyperclip' 
         'python-pysimplegui>=4.18' 
         'python-pystray'
         'youtube-dl')
makedepends=('python-setuptools')
changelog=$pkgname.changelog
source=("$pkgname-$pkgver.tar.gz::https://github.com/pyIDM/PyIDM/archive/$pkgver.tar.gz"
        "no_update.patch")
b2sums=('6a95c17beeff63e0aecaf6263ea214499b3fb762364ca5d538275074f57fa0719d8a1c8e5b56fb512c80fb0ccef2740f01d3f5c8f8bd696fc64ccbfee00b6fa9'
        '0e0049941a2cf01da6b43dee63c808f5752da911cd2b158941ca0bbb243ee296a7528700921479567fad70b4bd061863ec7698f0a095fa02fcac5026d6774fc3')

prepare() {
  cd "$srcdir/PyIDM-$pkgver"
  # Disables updates from the client (it should be updater through AUR)
  patch --strip=1 < ../no_update.patch
}

build() {
  cd "$srcdir/PyIDM-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/PyIDM-$pkgver"

  python setup.py install --root="$pkgdir" --skip-build --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
