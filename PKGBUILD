# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: archtem

_pkgname=qtodotxt2
pkgname=${_pkgname}-git
pkgver=20220704
pkgrel=1
pkgdesc="Cross-platform UI client for todo.txt files"
arch=('any')
url='https://github.com/QTodoTxt/QTodoTxt2'
license=('GPL-3.0-or-later')
depends=('python-dateutil' 'python-pyqt5' 'qt5-declarative' 'qt5-quickcontrols'
         'python-setuptools' 'hicolor-icon-theme')
makedepends=('git')
source=("${_pkgname}::git+https://github.com/QTodoTxt/QTodoTxt2.git"
        "qtodotxt.png"
        "qtodotxt2.desktop")
sha256sums=('SKIP'
            '569d8cdb7207662f5b639c0009bab22efed5d0a9165fa28171dce9ec25c2e630'
            '17aca05d232ee2ef4145da119bfefecc5dcefc0ea1c44f4d7d1777662277341d')

pkgver() {
    cd ${_pkgname}
    git log -1 --format="%cd" --date=short | tr -d '-'
}

package() {
  cd ${_pkgname}
  python setup.py install --root="$pkgdir/" --optimize=1

  install -Dm644 ../qtodotxt2.desktop \
    "${pkgdir}/usr/share/applications/qtodotxt2.desktop"

  install -Dm644 ../qtodotxt.png \
    "${pkgdir}/usr/share/icons/hicolor/48x48/apps/qtodotxt.png"

  install -Dm644 README.md \
    "${pkgdir}/usr/share/doc/${_pkgname}/README.md"

  # Remove leftover test files
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  rm -r "${pkgdir}/${site_packages}/tests"
}
