# Maintainer: Alexandre Pujol <alexandre@pujol.io>

_name='mausoleum'
pkgname="${_name}-git"
pkgver=0.4.1.r23.g4eea38a
pkgrel=1
pkgdesc='A Python GUI application, command line interface, and wrapper for Tomb'
arch=('any')
url='https://github.com/mandeep/Mausoleum'
license=('GPL3')
makedepends=('python-setuptools')
depends=('tomb'
         'python-pyqt5'
         'python-pytoml'
         'python-click'
         'python-appdirs')
conflicts=("${_name}")
provides=("${_name}" "${_name}-gui")
source=("${_name}::git://github.com/mandeep/Mausoleum.git"
        "mausoleum.desktop")
sha512sums=('SKIP'
            '1f0ca9c2b377be3c2d55d291013a8cab79499bd038216f18429f07918c6815c94474a19e4668c9e7bd8db6eb9358ef1dd9b8d91fb39bdb83c6a62114c5cdafe1')
options=(!emptydirs)

prepare() {
  # Use latest archlinux dependencies
  cd "${srcdir}/mausoleum"
  sed -i -e "s/==[0-9.]*//g" setup.py
}

pkgver() {
    cd "${_name}"
    git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/v//'
}

package() {
  cd "${srcdir}/mausoleum"
  python setup.py install --root="$pkgdir/" --optimize=1

  # Desktop file
  install -Dm644 "${srcdir}/${_name}.desktop" "${pkgdir}/usr/share/applications/${_name}.desktop"
}
