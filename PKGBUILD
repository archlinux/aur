# Maintainer: Carlo Capocasa <carlo@capocasa.net>
# Maintainer: Peter Sutton <peter@foxdogstudios.com>
# Contributor: amiguet <contact at matthieuamiguet dot ch>

# Based on python2-pyo by amiguet

pkgname=python-pyo
pkgver=0.9.1
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
md5sums=('f3ba1c4b9330bca4a241a4caabf42a67'
         '0ee8263a533e9ba5619cb72397d5d7ba')

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
