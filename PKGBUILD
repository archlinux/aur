# Maintainer: Carlo Capocasa <carlo@capocasa.net>
# Contributor: amiguet <contact at matthieuamiguet dot ch>

# Based on python2-pyo by amiguet

pkgname=python-pyo
pkgver=0.8.6
pkgrel=1
pkgdesc="A Python module written in C to help digital signal processing script creation."
arch=('i686' 'x86_64')
url="http://ajaxsoundstudio.com/software/pyo/"
license=('GPL')
depends=('python' 'portmidi' 'portaudio' 'liblo' 'libsndfile')
optdepends=('wxpython: wxWidgets GUI')
provides=("pyo=$pkgver" "python-pyo=$pkgver")
conflicts=('pyo')
source=("http://ajaxsoundstudio.com/downloads/pyo_$pkgver-src.tar.bz2"
	"http://ajaxsoundstudio.com/downloads/pyo_$pkgver-doc.tar.bz2")
md5sums=('5b461f18b8c1cbeee8a8f24e9dc3bda1'
         '5c9b9c3bebe884444f80e8e8f048d975')

export PYTHON=python

build() {
  cd "$srcdir/pyo_$pkgver-src"

  $PYTHON setup.py build --use-double --use-jack
}

package() {
  cd "$srcdir/pyo_$pkgver-src"
  $PYTHON setup.py install --use-double \
                           --use-jack \
                           --root="$pkgdir/"

  # examples
  install -d "$pkgdir/usr/share/$pkgname"
  cp -a examples "$pkgdir/usr/share/$pkgname"

  # docs
  install -d "$pkgdir/usr/share/doc/$pkgname"
  cp -a ../pyo_$pkgver-doc/* "$pkgdir/usr/share/doc/$pkgname"

  # python2 fix
  #sed -i "s|env python|&2|g" `grep -rl "env python" "$pkgdir"`
}
