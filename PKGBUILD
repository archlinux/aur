# Maintainer: Evgenii Alekseev
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Manuel Schneider  <manuelschneid3r at googles mail>

pkgname=albert
pkgver=34.0.6
pkgrel=1
pkgdesc="A sophisticated standalone keyboard launcher"
arch=('x86_64')
url="https://github.com/albertlauncher"
license=('custom')
depends=('hicolor-icon-theme' 'qcoro' 'qt6-5compat' 'qt6-declarative' 'qt6-scxml' 'qt6-shadertools' 'qt6-svg' 'qtkeychain-qt6')
makedepends=('cmake' 'git' 'libqalculate' 'pybind11' 'python' 'qt6-tools')
optdepends=('libarchive: documentation plugin'
            'libqalculate: calculator plugin'
            'python: python extension')
	    source=("https://github.com/albertlauncher/albert/releases/download/v${pkgver}/v${pkgver}.tar.gz")


build() {
  mkdir -p build
  cd build

  cmake \
    -DCMAKE_BUILD_TYPE=MinSizeRel \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_FIND_PACKAGE_RESOLVE_SYMLINKS=ON \
    -DQHOTKEY_INSTALL=OFF \
    -DBUILD_PLUGIN_DEBUG=OFF \
    ../$pkgname

  make
}


package() {
  cd build

  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha512sums=('8ec60b946e36c42a903ba474966110ae2fcf5fdf5526db718b5ca89c34f13984838075250828d6d023468592a886ebbfc2f63cec750fd0ef668511c8e0188c5f')
