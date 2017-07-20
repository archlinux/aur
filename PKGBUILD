# Maintainer: Alexandre Pujol <alexandre@pujol.io>

_name='mausoleum'
pkgname="${_name}"
pkgver=0.8.3
pkgrel=2
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
conflicts=("${_name}-git")
provides=("${_name}" "${_name}-gui")
source=("https://github.com/mandeep/Mausoleum/archive/v${pkgver}.tar.gz"
        "mausoleum.desktop")
sha512sums=('23ec29c2393125558da0db9f04bbdf995a46d8166dee8ba6dbe4d66bb669f48c6ce8f40c41db2073897deb5f329fe8c203ac3ba42da8d2aefddb3d5068d53106'
            '1f0ca9c2b377be3c2d55d291013a8cab79499bd038216f18429f07918c6815c94474a19e4668c9e7bd8db6eb9358ef1dd9b8d91fb39bdb83c6a62114c5cdafe1')

prepare() {
  # Use latest archlinux dependencies
  cd "${srcdir}/Mausoleum-${pkgver}"
  sed -i -e "s/==[0-9.]*//g" setup.py
}

package() {
  cd "${srcdir}/Mausoleum-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1

  # Desktop file
  install -Dm644 "${srcdir}/${_name}.desktop" "${pkgdir}/usr/share/applications/${_name}.desktop"
}
