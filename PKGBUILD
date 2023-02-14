# Maintainer: Alex Dewar <alex.dewar@gmx.co.uk>
# Contributor: Marcin Mielniczuk <marmistrz dot dev at zoho dot eu>
# Contributor: Sam S. <smls75@gmail.com>
# Contributor: Nuno Araujo <nuno.araujo@russo79.com>

pkgname=mnemosyne
pkgver=2.10.1
pkgrel=1
pkgdesc="A flash-card tool with a sophisticated card review algorithm"
arch=('any')
url='https://www.mnemosyne-proj.org'
license=('GPL')
depends=('python-pyqt6' 'qt6-webengine' 'qt6-multimedia' 'python-argon2_cffi'
         'python-pillow' 'python-matplotlib' 'python-cherrypy' 'python-webob'
         'python-pyqtwebengine')
makedepends=('python-setuptools')
optdepends=('texlive-core: support for mathematical formulae in cards'
            'ttf-ms-fonts: support for non-latin labels on statistic plots'
            'python-cheroot: support for starting a sync server'
            'python-opengl: mentioned in a non-fatal warning'
            'mplayer: for playing audio and video externally'
            'python-googletrans: support for google translate'
        'python-google_trans_new: support for google translate'
        'python-gtts: support for text-to-speech')
conflicts=('mnemosyne-bzr')

_dlurl="https://github.com/mnemosyne-proj/mnemosyne"
source=("https://downloads.sourceforge.net/mnemosyne-proj/Mnemosyne-${pkgver}.tar.gz")
sha256sums=('cc8efd8ae4576f94b463ceca7dd1be1ca7345d535038070147b66dfce75a04fe')

prepare() {
  cd "Mnemosyne-${pkgver}/"

  # Fix Windows line endings
  sed -i "s/\r//g" mnemosyne/pyqt_ui/mnemosyne
  find -name '*py' -exec sed -i "s/\r//g" {} \;
}

build() {
  cd "Mnemosyne-${pkgver}/"
  python setup.py build
}

package() {
  cd "Mnemosyne-${pkgver}/"
  python setup.py install --root="${pkgdir}" --optimize=1
}

