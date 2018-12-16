# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: jfperini <@jfperini>

pkgname=veusz-git
pkgver=3.0.1.7.g444bf3ff
pkgrel=2
pkgdesc="A scientific plotting and graphing package, designed to create publication-ready Postscript or PDF output."
url="http://home.gna.org/veusz"
arch=('x86_64')
license=('GPL2')
depends=('python-pyqt5' 'python-numpy' 'python-sip' 'hicolor-icon-theme' 'cblas')
makedepends=('git' 'sip')
optdepends=('ghostscript: for EPS/PS output'
	    'python-pyfits: for reading files in FITS format'
	    'python-dbus: for dbus interface'
            'python-astropy: for VO table import')
conflicts=('veusz')
provides=('veusz')
source=('git+https://github.com/jeremysanders/veusz' 'veusz.desktop')
md5sums=('SKIP'
         '3823fe5961f3975a4dff2967aadaa14f')

pkgver() {
  cd ${pkgname%-git}
  git describe --tags | tr - .|cut -c7-
}

build() {
  cd ${pkgname%-git}
  python setup.py build
}

package() {
  cd ${pkgname%-git}
  python setup.py install --root="$pkgdir" --prefix=/usr
  for _i in 16 32 48 64 128; do
    install -Dm644 "icons/veusz_${_i}.png" "$pkgdir"/usr/share/icons/hicolor/${_i}x${_i}/apps/veusz.png
  done
  install -Dm644 "$srcdir/veusz.desktop" "$pkgdir"/usr/share/applications/veusz.desktop
}
