# Maintainer: linkfrg <linkfrg.dev@proton.me>
pkgname=python-ignis
_pkgname=ignis
pkgver=0.5.1
pkgrel=2
pkgdesc="A widget framework for building desktop shells, written and configurable in Python"
arch=('x86_64')
url="https://github.com/ignis-sh/ignis"
license=('LGPL-2.1-or-later')
makedepends=(gobject-introspection
             meson
             meson-python
             python-build
             python-installer
             python-wheel)
depends=(python 
         glib2 
         glib2-devel 
         gtk4 
         gtk4-layer-shell 
         libpulse 
         python-cairo 
         python-gobject 
         python-click 
         python-loguru)
optdepends=('gst-plugin-pipewire: required for recorder service'
            'gst-plugins-good: required for recorder service'
            'gst-plugins-ugly: required for recorder service'
            'networkmanager: required for network service'
            'dart-sass: SASS/SCSS compilation support'
            'upower: required for UPower Service'
            'gnome-bluetooth-3.0: required for Bluetooth Service')

provides=('python-ignis' 'ignis')
conflicts=('ignis')
source=("$_pkgname-v$pkgver.tar.gz::$url/releases/download/v${pkgver}/ignis-v${pkgver}.tar.gz")
sha256sums=('3ea240440584f336a31874f79a1e76e3a9f18651ff2ecaac7dab54807c1fd371')

build() {
  cd $srcdir/$_pkgname
  python -m build --wheel --no-isolation
}

package() {
  cd $srcdir/$_pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
}
