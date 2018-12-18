# Maintainer: takeshix <deen [at] adversec [dot] com>

_gitname=deen
pkgname="${_gitname}-git"
pkgver=1.6.6.87753fb
pkgrel=1
pkgdesc='Generic data encoding/decoding application built with PyQt5'
url='https://github.com/takeshixx/deen'
arch=('any')
license=('Apache 2.0')
depends=('python' 'python-setuptools' 'python-pyqt5')
optdepends=('python-pyopenssl' 'python-jsbeautifier' 'python-keystone'
            'python-capstone' 'python-jose' 'python-bcrypt'
            'python-xmltodict')
makedepends=('git')
provides=('deen')
conflicts=('deen')
source=("${_gitname}::git+https://github.com/takeshixx/deen.git")
sha512sums=('SKIP')

pkgver() {
  cd ${_gitname}
  printf "%s.%s" "$(git describe --tags --abbrev=0|sed 's/^v//'|sed 's/\-/_/')" \
                 "$(git rev-parse --short HEAD)"
}

package() {
  cd ${_gitname}
  python3 setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 "deen/media/${_gitname}.desktop" "${pkgdir}/usr/share/applications/${_gitname}.desktop"
  install -Dm644 "deen/media/icon.png" "${pkgdir}/usr/share/pixmaps/deen.png"
}

# vim: ts=2 sw=2
