# Maintainer: Franck Stauffer <franck.stauffer@monaco.mc>

pkgname=pyidm
pkgver=2020.9.20
pkgrel=1
pkgdesc="Python open source alternative to IDM (Internet Download Manager)"
arch=('any')
url="https://github.com/pyIDM/PyIDM"
license=('LGPL3')
depends=('ffmpeg'
         'python>=3.6' 
         'python-awesometkinter'
         'python-certifi' 
         'python-pillow'
         'python-plyer' 
         'python-pycurl' 
         'python-pystray'
         'youtube-dl')
makedepends=('python-setuptools')
changelog=$pkgname.changelog
source=("$pkgname-$pkgver.tar.gz::https://github.com/pyIDM/PyIDM/archive/$pkgver.tar.gz"
        "no_update.patch")
b2sums=('5fd2580871e21e1ed1a9039d9bb62da286f930718989719cc6fdb04c842be6f865ee801b0b7dd282e63f51d9f0285bddcec777f40b852ee600aa2f2658e1e104'
        '677078adaca806f4d495af63e829bf96cc06d39d26cf749434fe7112fd45c555f826ea9de41c7c67e071c00df6e29572c9b01c208925bff94c07365522427cb6')

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
