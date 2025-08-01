# Maintainer: revel <revelΘmuub·net>
# Contributor: shild <sxp@bk.ru>
# Contributor: m4tx <m4tx@m4tx.p>
# Contributor: tbhaxor <tbhaxor@proton.me>

pkgname=edb-debugger
pkgver=1.5.0
pkgrel=3
pkgdesc="EDB (Evan's Debugger) is a cross platform AArch32/x86/x86-64 debugger, inspired by Ollydbg."
arch=('i686' 'x86_64')
url='http://www.codef00.com/projects#debugger'
license=('GPL2')
depends=('qt5-xmlpatterns>=5.9' 'qt5-svg>=5.9' 'capstone>=3.0')
makedepends=('cmake' 'coreutils' 'qt5-tools>=5.9')
optdepends=('graphviz>=2.38.0')
source=("https://github.com/eteran/edb-debugger/releases/download/$pkgver/edb-debugger-$pkgver.tgz"
        'edb.desktop')
sha256sums=('04382485a60eb585f7dfa72993ee2dd2753564556a4abbfd747ec44809a0ad0c'
            'f3e725642c6b87d5a7fd25331a9560d4f9803c22566875b722bc27e275f311a6')

prepare() {
  cmake -S$pkgname -Bbuild -Wno-deprecated \
        -DCMAKE_INSTALL_PREFIX="$pkgdir/usr/" \
        -DDEFAULT_PLUGIN_DIR="/usr/lib/edb/" \
        -DCMAKE_POLICY_VERSION_MINIMUM=3.5
}

build() {
  cmake --build build
}

package() {
  cmake --install build

  # icons
  install -Dm644 $pkgname/src/res/images/edb48-logo.png "$pkgdir/usr/share/pixmaps/edb.png"
  install -Dm644 $pkgname/src/res/images/edb48-logo.png "$pkgdir/usr/share/icons/hicolor/48x48/apps/edb.png"

  # install desktop file
  install -Dm644 edb.desktop "$pkgdir/usr/share/applications/edb.desktop"
}

