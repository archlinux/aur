# Maintainer: Jefferson Gonzalez <jgmdev@gmail.com>

pkgname=mailnagtray
pkgver=0.4
pkgrel=1
pkgdesc="A tray icon applet for mail monitoring using Mailnag"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/jgmdev/mailnagtray"
license=('GPL')
depends=('mailnag' 'qt6-base' 'libnotify')
makedepends=('meson' 'qt6-tools')
optdepends=('gnome-control-center: administer online accounts')
source=("https://github.com/jgmdev/mailnagtray/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9e4494dd4493da2140b633ab3a4a6af6740b0a90ba65603e029ab182209a5f5a')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  meson setup --buildtype release build --prefix /usr
  meson compile -C build
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  DESTDIR="${pkgdir}" meson install -C build
}
