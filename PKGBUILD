# Maintainer: Evgenii Alekseev
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Manuel Schneider  <manuelschneid3r at googles mail>

pkgname=albert
pkgver=0.27.4
pkgrel=1
pkgdesc="A sophisticated standalone keyboard launcher"
arch=('x86_64')
url="https://github.com/albertlauncher"
license=('custom')
depends=('hicolor-icon-theme' 'qt6-5compat' 'qt6-declarative' 'qt6-scxml' 'qt6-shadertools' 'qt6-svg')
makedepends=('cmake' 'git' 'libqalculate' 'pybind11' 'python' 'qt6-tools')
optdepends=('libarchive: documentation plugin'
            'libqalculate: calculator plugin'
            'python: python extension')
source=("https://github.com/albertlauncher/albert/releases/download/v${pkgver}/v${pkgver}.tar.gz")

build() {
  mkdir -p build
  cd build

  cmake ../$pkgname \
    -DCMAKE_BUILD_TYPE=MinSizeRel \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_FIND_PACKAGE_RESOLVE_SYMLINKS=ON \
    -DQHOTKEY_INSTALL=OFF \
    -DBUILD_PLUGIN_APPLICATIONS=ON \
    -DBUILD_PLUGIN_CAFFEINE=ON \
    -DBUILD_PLUGIN_CALCULATOR_QALCULATE=ON \
    -DBUILD_PLUGIN_CHROMIUM=ON \
    -DBUILD_PLUGIN_CLIPBOARD=ON \
    -DBUILD_PLUGIN_DATETIME=ON \
    -DBUILD_PLUGIN_DEBUG=OFF \
    -DBUILD_PLUGIN_DICTIONARY=ON \
    -DBUILD_PLUGIN_FILES=ON \
    -DBUILD_PLUGIN_HASH=ON \
    -DBUILD_PLUGIN_MPRIS=ON \
    -DBUILD_PLUGIN_PATH=ON \
    -DBUILD_PLUGIN_PYTHON=ON \
    -DBUILD_PLUGIN_SNIPPETS=ON \
    -DBUILD_PLUGIN_SSH=ON \
    -DBUILD_PLUGIN_SYSTEM=ON \
    -DBUILD_PLUGIN_TIMER=ON \
    -DBUILD_PLUGIN_TIMEZONES=ON \
    -DBUILD_PLUGIN_URLHANDLER=ON \
    -DBUILD_PLUGIN_VPN=ON \
    -DBUILD_PLUGIN_WEBSEARCH=ON \
    -DBUILD_PLUGIN_WIDGETSBOXMODEL=ON

  make
}


package() {
  cd build

  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha512sums=('973f3f55d19e2650b1f54ebea19a390a998166df41d13ecdf65b23cf4e59ca1a5e684d7c22460fb47d7c845819ef201f284105d793ef82967d6ec951c8b294e6')
