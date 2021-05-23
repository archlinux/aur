# Maintainer: Franck Stauffer <franck.stauffer@monaco.mc>

pkgname=firedm
pkgver=2021.5.22
pkgrel=1
pkgdesc="Python open source alternative to IDM (Internet Download Manager)"
arch=('any')
url='https://github.com/firedm/FireDM'
license=('LGPL3')
depends=('ffmpeg'
         'python>=3.6' 
         'python-awesometkinter>=2021.5.23'
         'python-certifi'
         'python-packaging'
         'python-pillow>=6.0.0'
         'python-plyer'
         'python-pycurl'
         'python-pystray'
         'youtube-dl'
         'youtube-dlp')
makedepends=('python-setuptools')
changelog=$pkgname.changelog
replaces=('pyidm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/firedm/FireDM/archive/$pkgver.tar.gz")
b2sums=('0300143e5659f257f3705f39bef64f7aae2c2bed4cc4c5e8146e7175c6886dfe5c4014e19bb63cc79de72423fd74ee2493b9755f9bc5c4e8fb11b3e6147f131d')

prepare() {
  sed -i 's/disable_update_feature = False/disable_update_feature = True/' "$srcdir/FireDM-$pkgver/firedm/config.py"
}

build() {
  cd "$srcdir/FireDM-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/FireDM-$pkgver"
  python setup.py install --root="$pkgdir" --skip-build --optimize=1
}
