# Maintainer: Qontinuum <qontinuum.dev@protonmail.ch>

pkgname=firedm
pkgver=2021.6.18
pkgrel=1
pkgdesc="Python open source alternative to IDM (Internet Download Manager)"
arch=('any')
url='https://github.com/firedm/FireDM'
license=('LGPL3')
depends=('ffmpeg'
         'python>=3.6' 
         'python-awesometkinter>=2021.6.4'
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
install=firedm.install
replaces=('pyidm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/firedm/FireDM/archive/$pkgver.tar.gz"
        firedm.{desktop,png})
b2sums=('bd3e89bc08c50d3019448e8fa75ccdc219c79c7bc67c2cbbc263722bb63872fa937a59fff0ee5dcbb04baa7efb74ab1f10f772caee0fca8b9b9619567a717cce'
        '0e172a987e5a9967df0d906e5906daeb38868e8222b6eb6afebcb3fcc9d2f5b6b26dbe36e4a52d0cd66628d29d5bec16b0f76618a04f0ec02ed86cf811d5e172'
        '3cf1a71d1a324e5182cf119cc0895651385451f4bc90835415e7897b713af5394662c8fb1a20d86dbb941613ee8f675079922b92501eb77bcdd5bc85d30d4df0')

prepare() {
  sed -i 's/disable_update_feature = False/disable_update_feature = True/' "$srcdir/FireDM-$pkgver/firedm/config.py"
}

build() {
  cd "$srcdir/FireDM-$pkgver"
  python setup.py build
}

package() {
  install -Dvm644 firedm.png "$pkgdir/usr/share/pixmaps/firedm.png"
  install -Dvm644 firedm.desktop "$pkgdir/usr/share/applications/firedm.desktop"
  cd "$srcdir/FireDM-$pkgver"
  python setup.py install --root="$pkgdir" --skip-build --optimize=1
}
