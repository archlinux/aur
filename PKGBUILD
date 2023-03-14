# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Alex Dewar <alex.dewar@gmx.co.uk>
# Contributor: Marcin Mielniczuk <marmistrz dot dev at zoho dot eu>
# Contributor: Sam S. <smls75@gmail.com>
# Contributor: Nuno Araujo <nuno.araujo@russo79.com>

pkgname=mnemosyne
pkgver=2.10.1
pkgrel=2
pkgdesc="A flash-card tool with a sophisticated card review algorithm"
arch=('any')
url='https://www.mnemosyne-proj.org'
license=('LGPL3' 'custom:AGPL3 with Mnemosyne attribution requirement')
depends=('python-pyqt6' 'python-pyqt6-webengine' 'qt6-multimedia'
         'python-argon2_cffi' 'python-pillow' 'python-matplotlib'
         'python-cherrypy' 'python-webob')
makedepends=('python-setuptools')
optdepends=('texlive-core: support for mathematical formulae in cards'
            'ttf-ms-fonts: support for non-latin labels on statistic plots'
            'python-cheroot: support for starting a sync server'
            'python-opengl: mentioned in a non-fatal warning'
            'mplayer: for playing audio and video externally'
            'python-googletrans: support for google translate'
            'python-google_trans_new: support for google translate'
            'python-gtts: support for text-to-speech')
source=("https://github.com/mnemosyne-proj/mnemosyne/releases/download/${pkgver}/Mnemosyne-${pkgver}.tar.gz"
        "LICENSE-${pkgver}::https://github.com/mnemosyne-proj/mnemosyne/raw/${pkgver}/mnemosyne/LICENSE")
sha256sums=('cc8efd8ae4576f94b463ceca7dd1be1ca7345d535038070147b66dfce75a04fe'
            'dfb5787cc91234cb13b794c55bfaa7890839c0f0b45b61784143d62f95704183')

prepare() {
  cd "${srcdir}/Mnemosyne-${pkgver}"

  # Fix Windows line endings
  sed -i "s/\r//g" mnemosyne/pyqt_ui/mnemosyne
  find -name '*py' -exec sed -i "s/\r//g" {} \;
}

build() {
  cd "${srcdir}/Mnemosyne-${pkgver}"

  python setup.py build
}

package() {
  cd "${srcdir}/Mnemosyne-${pkgver}"

  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm644 "${srcdir}/LICENSE-${pkgver}" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
