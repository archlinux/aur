# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=qt5-quickcontrols-nemo
pkgver=5.7.7
pkgrel=1
pkgdesc="QML components for Nemomobile, based on QtQuickControls"
arch=('x86_64')
url="https://github.com/nemomobile-ux/qtquickcontrols-nemo"
license=('LGPL' 'Apache')
depends=('nemo-qml-plugin-configuration'
         'nemo-theme-glacier' 'qt5-graphicaleffects' 'qt5-quickcontrols' 'qt5-virtualkeyboard')
makedepends=('cmake' 'git')
source=("git+https://github.com/nemomobile-ux/qtquickcontrols-nemo.git#tag=$pkgver")
sha512sums=('51032dbb7d37284605df6e1e2c2a11e4132fdf53c69724c50bf8212e0b9e3b8ca7ff3a04b24f53869f659d3cbba6abdbee06efe2a1e3b2234222dd22e84a1b6b')

prepare() {
  cd qtquickcontrols-nemo

  # Remove a stale slot declaration that breaks moc-generated code:
  # https://github.com/nemomobile-ux/qtquickcontrols-nemo/commit/01280d8c38a06cc7d27a1d10861f80a7d638ceb4
  git cherry-pick -n 01280d8c38a06cc7d27a1d10861f80a7d638ceb4
}

build() {
  cd qtquickcontrols-nemo
  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd qtquickcontrols-nemo
  make DESTDIR="$pkgdir" install
}
