# Maintainer: Tasos Sahanidis <aur@tasossah.com>
# Contributor: Light2Yellow <oleksii.vilchanskyi@gmail.com>
pkgname=ckb-next
pkgver=0.4.1
pkgrel=2
pkgdesc="Corsair Keyboard and Mouse Input Driver, release version"
arch=('i686' 'x86_64')
url="https://github.com/ckb-next/ckb-next"
license=('GPL2')
depends=('qt5-base' 'hicolor-icon-theme' 'quazip')
makedepends=('git' 'cmake')
optdepends=('libappindicator-gtk2: Ayatana indicators in Unity, KDE or Systray (GTK+ 2 library)' 'libpulse')
conflicts=('ckb-git' 'ckb-git-latest' 'ckb-next')
provides=('ckb-next')
install=ckb-next.install
source=("https://github.com/ckb-next/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('373e7cc5bb2b894f4ef7e1c9d76f463842d4f389dfe4717e9beb39662a185351')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"

  cmake -H. -Bbuild \
    -DCMAKE_INSTALL_PREFIX="/usr"                 \
    -DCMAKE_BUILD_TYPE="Release"                  \
    -DCMAKE_INSTALL_LIBDIR="lib"                  \
    -DCMAKE_INSTALL_LIBEXECDIR="lib"              \
    -DDISABLE_UPDATER=1                           \
    -DUDEV_RULE_DIRECTORY="/usr/lib/udev/rules.d" \
    -DFORCE_INIT_SYSTEM="systemd"
  cmake --build build --target all
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"

  DESTDIR="$pkgdir" cmake --build build --target install
}
