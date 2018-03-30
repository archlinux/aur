# Maintainer: Iván Ruvalcaba <mario.i.ruvalcaba[at]gmail[dot]com>

_pkgname=qtodotxt2
pkgname=${_pkgname}-git
_commit=32bb7f3 # 7 digits
pkgver=20180127
pkgrel=2
pkgdesc="A cross-platform UI client for todo.txt files"
arch=('i686' 'x86_64')
url="https://github.com/QTodoTxt/QTodoTxt2"
license=('GPL3')
depends=('python-dateutil' 'python-pyqt5' 'qt5-declarative' 'qt5-quickcontrols')
source=("${_pkgname}::git+${url}.git#commit=${_commit}"
        "qtodotxt.png"
        "qtodotxt2.desktop")
sha256sums=('SKIP'
            '569d8cdb7207662f5b639c0009bab22efed5d0a9165fa28171dce9ec25c2e630'
            '17aca05d232ee2ef4145da119bfefecc5dcefc0ea1c44f4d7d1777662277341d')

pkgver() {
    cd "${_pkgname}"
    git log -1 --format="%cd" --date=short | tr -d '-'
}

package() {
  cd "$srcdir/${_pkgname}"
  python setup.py install --root="$pkgdir/" --optimize=1

  # Desktop file
  install -Dm644 ../../qtodotxt2.desktop \
    "${pkgdir}/usr/share/applications/qtodotxt2.desktop"

  # Icons
  install -Dm644 ../../qtodotxt.png \
    "${pkgdir}/usr/share/icons/hicolor/48x48/apps/qtodotxt.png"

  # Doc files
  install -Dm644 README.md \
    "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 AUTHORS \
    "${pkgdir}/usr/share/doc/${_pkgname}/AUTHORS"
  install -Dm644 TRANSLATION.md \
    "${pkgdir}/usr/share/doc/${_pkgname}/TRANSLATION.md"
}
