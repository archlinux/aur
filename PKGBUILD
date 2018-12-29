# Maintainer: Tasos Sahanidis <aur@tasossah.com>
# Contributor: Light2Yellow <oleksii.vilchanskyi@gmail.com>
pkgname=ckb-next
pkgver=0.3.2
pkgrel=1
pkgdesc="Corsair Keyboard and Mouse Input Driver, release version"
arch=('i686' 'x86_64')
url="https://github.com/ckb-next/ckb-next"
license=('GPL2')
depends=('qt5-base' 'hicolor-icon-theme')
makedepends=('git' 'cmake')
optdepends=('libappindicator-gtk2: Ayatana indicators in Unity, KDE or Systray (GTK+ 2 library)')
conflicts=('ckb-git' 'ckb-git-latest' 'ckb-next')
provides=('ckb-next')
install=ckb-next.install
source=("https://github.com/ckb-next/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('1692065278a1f41e3ffcd300d6999462')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"

  cmake -H. -Bbuild \
    -DCMAKE_INSTALL_PREFIX="/usr"    \
    -DCMAKE_BUILD_TYPE="Release"     \
    -DCMAKE_INSTALL_LIBEXECDIR="lib" \
    -DDISABLE_UPDATER=1
  cmake --build build --target all
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"

  DESTDIR="$pkgdir" cmake --build build --target install
}
