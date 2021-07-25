# Maintainer: Peter Semiletov <peter.semiletov@gmail.com>

pkgname=tea-qt-git
pkgver=60.4.0.r8.gef475f1
pkgrel=1
pkgdesc="Rich-featured text editor for Linux, *BSD, Windows, OS/2, Mac and Haiku OS. Build from stable git-commit with PDF and DJVU support."
arch=('x86_64')
url="https://tea.ourproject.org"
license=('GPL3')
depends=('qt6-base' 'qt6-5compat' 'gcc-libs' 'zlib' 'hunspell' 'desktop-file-utils')
optdepends=('poppler-qt6: open and search text in PDF files'
            'djvulibre: open and search in DJVU')

makedepends=('cmake' 'git')
provides=('tea')
conflicts=('tea')

source=("git+https://github.com/psemiletov/tea-qt.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/tea-qt"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  mkdir -p "${srcdir}/tea-qt/b"
  cd "${srcdir}/tea-qt/b"
  cmake .. -DUSE_PDF=ON -DUSE_DJVU=ON -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package(){
  cd "${srcdir}/tea-qt/b"
  make DESTDIR="$pkgdir" install
}
