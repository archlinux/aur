# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>
# Contributor: Ray Kohler <ataraxia937@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: moostik <mooostik_at_gmail.com>

pkgname=veusz
pkgver=1.23.2
pkgrel=1
pkgdesc="A scientific plotting and graphing package, designed to create publication-ready Postscript or PDF output"
arch=('i686' 'x86_64')
url="http://home.gna.org/${pkgname}/"
license=('GPL2')
depends=('python2-pyqt4' 'python2-numpy')
optdepends=('python2-pyfits: for reading files in FITS format'
#            'python2-emf: for EMF export' - http://pyemf.sourceforge.net/ - package missing
	    'python2-dbus: for dbus interface'
#            'python2-pyminuit2: for numerical function minimization' - http://code.google.com/p/pyminuit/ - package missing
            'python2-astropy: for VO table import')
install='veusz.install'
source=("http://download.gna.org/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}.desktop")
md5sums=('4a687e98e87f95c4646602b285a11e85'
         '3823fe5961f3975a4dff2967aadaa14f')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --prefix=/usr
  for _i in 16 32 48 64 128; do
    install -D -m644 "icons/veusz_${_i}.png" \
        "${pkgdir}/usr/share/icons/hicolor/${_i}x${_i}/apps/veusz.png"
  done
  install -D -m644 "${srcdir}/veusz.desktop" \
      "${pkgdir}/usr/share/applications/veusz.desktop"
}
