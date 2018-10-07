# Maintainer Severin Glöckner <severin dot gloeckner at stud dot htwk minus leipzig dot de>
# Contributor: Federico Cinelli <cinelli.federico@gmail.com>

pkgname=ninja-ide-git
pkgver=20180921
pkgrel=1
pkgdesc="Cross-platform IDE focused on Python application development"
arch=('any')
url="http://ninja-ide.org"
license=('GPL3')
depends=('python' 'python-pyqt5' 'qt5-declarative')
makedepends=('python-setuptools')
source=("git+https://github.com/ninja-ide/ninja-ide.git"
        "ninja-ide-git.desktop"
        "setup.py"
        "MANIFEST.in")
md5sums=('SKIP'
         '8501ff78ec0150270be0f48ee87bddb5'
         '9f9a5b9894d192de503bc98969067f56'
         'e8fd6b8243172d576d032c26d9140285')

pkgver() {
  cd "$srcdir/ninja-ide"
  git log -1 --date=short --pretty=format:%ad | sed 's/-//g'
}

prepare() {
  cd "$srcdir/ninja-ide"
  rm -rf build *.egg-info
  rm -rf ninja_tests ninja_profiling
}
package() {
  cd "$srcdir/ninja-ide"

  cp $srcdir/setup.py .
  cp $srcdir/MANIFEST.in .

  python3 setup.py install --root="$pkgdir" -O1

  install -Dm755 "$srcdir/ninja-ide/ninja-ide.py" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$srcdir/ninja-ide/ninja_ide/images/icon.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/$pkgname.png"
  install -Dm644 "$srcdir/ninja-ide/icon.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
}
