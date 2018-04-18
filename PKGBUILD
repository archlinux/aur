# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>
# Contributor: Ray Kohler <ataraxia937@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: moostik <mooostik_at_gmail.com>

pkgname=veusz
pkgver=2.2.2
pkgrel=1
pkgdesc="A scientific plotting and graphing package, designed to create publication-ready PDF or SVG output"
arch=('x86_64')
url="https://veusz.github.io/"
license=('GPL2')
depends=('python-pyqt5' 'python-numpy' 'hicolor-icon-theme')
optdepends=('python-pyfits: for reading files in FITS format'
#            'python-emf: for EMF export' - http://pyemf.sourceforge.net/ - package missing
            'python-dbus: for dbus interface'
            'python-iminuit: for numerical function minimization'
            'python-astropy: for VO table import')
source=("https://github.com/veusz/veusz/releases/download/veusz-${pkgver}/veusz-${pkgver}.tar.gz")
sha256sums=('d630553f8531e9442d2d8077d0c79287760de52804fb13c342512384e77546c2')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"

  python setup.py install --root="${pkgdir}" --prefix=/usr
  for _i in 16 32 48 64 128; do
    install -D -m644 "icons/veusz_${_i}.png" \
        "${pkgdir}/usr/share/icons/hicolor/${_i}x${_i}/apps/veusz.png"
  done
  install -D -m644 "support/veusz.desktop" \
      "${pkgdir}/usr/share/applications/veusz.desktop"
}
