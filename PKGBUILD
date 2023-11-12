# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Alex Dewar <alex.dewar@gmx.co.uk>
# Contributor: Marcin Mielniczuk <marmistrz dot dev at zoho dot eu>
# Contributor: Sam S. <smls75@gmail.com>
# Contributor: Nuno Araujo <nuno.araujo@russo79.com>

pkgname=mnemosyne
pkgver=2.11
pkgrel=1
pkgdesc="A flash-card tool with a sophisticated card review algorithm"
arch=('any')
url='https://www.mnemosyne-proj.org'
license=('LGPL3' 'custom:AGPL3 with Mnemosyne attribution requirement')
depends=('python' 'python-pyqt6' 'python-pyqt6-webengine' 'qt6-multimedia'
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
source=("mnemosyne-${pkgver}.tar.gz::https://github.com/mnemosyne-proj/mnemosyne/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('a042252c2fb8c69c44d048e3f3cfca142189fe7d1bb55e0ad98f8edeeb3ae1cd')

prepare() {
  cd "${srcdir}/mnemosyne-${pkgver}"

  # Fix Windows line endings
  find -name '*py' -exec sed -i "s/\r//g" {} \;
}

build() {
  cd "${srcdir}/mnemosyne-${pkgver}"

  # Newer, standards-based build system doesn't seem to install properly (at
  # least the desktop entry and gettext catalogs are missing and some other
  # files in seemingly strange locations). Will figure that out later.
  python setup.py build
}

package() {
  cd "${srcdir}/mnemosyne-${pkgver}"

  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm644 "LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
