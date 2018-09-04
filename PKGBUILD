# Maintainer: Carlo Capocasa <carlo@capocasa.net>
# Maintainer: Peter Sutton <peter@foxdogstudios.com>
# Contributor: amiguet <contact at matthieuamiguet dot ch>

# Based on python2-pyo by amiguet

pkgname=python-pyo
pkgver=0.9.0
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
md5sums=('de7659eba26a6c93c5b0a8d86459857a'
         '33a773b02bfe077bf00f854547f2e9c2')

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
