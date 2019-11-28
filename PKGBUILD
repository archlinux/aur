# Maintainer: Alex Dewar <alex.dewar@gmx.co.uk>
# Contributor: Marcin Mielniczuk <marmistrz dot dev at zoho dot eu>
# Contributor: Sam S. <smls75@gmail.com>
# Contributor: Nuno Araujo <nuno.araujo@russo79.com>

pkgname=mnemosyne
pkgver=2.7
pkgrel=1
pkgdesc="A flash-card tool with a sophisticated card review algorithm"
arch=('any')
url='http://www.mnemosyne-proj.org'
license=('GPL')
depends=('python-pyqt5' 'qt5-webengine'
         'python-pillow' 'python-matplotlib' 'python-cherrypy' 'python-webob'
         'python-pyqtwebengine' 'python-googletrans' 'python-gtts')
makedepends=('python-setuptools')
optdepends=('texlive-core: support for mathematical formulae in cards'
            'ttf-ms-fonts: support for non-latin labels on statistic plots'
            'python-cheroot: support for starting a sync server'
            'python-opengl: mentioned in a non-fatal warning')
conflicts=('mnemosyne-bzr')
install='mnemosyne.install'

source=("http://downloads.sourceforge.net/mnemosyne-proj/Mnemosyne-${pkgver}.tar.gz"
        "python38.patch")
sha256sums=('44e0a61a77ef91410da89a02c4407527e225562a44a792a9206ca83be806a753'
            '362bb526d2eb55dbf026d6a0e4436ee3757da0f4bf11600982099993c3ae7e79')
prepare() {
    cd "Mnemosyne-${pkgver}"
    patch -p1 < ../python38.patch
}

build() {
  cd "Mnemosyne-${pkgver}/"

  python setup.py build
}

package() {
  cd "Mnemosyne-${pkgver}/"
  python setup.py install --root="${pkgdir}" --optimize=1
}

