# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: ItzSelenux
pkgname=papirus-folders-gui
pkgver=1.5
pkgrel=2
pkgdesc="A graphical user interface for papirus-folders"
url="https://github.com/ItzSelenux/papirus-folders-gui"
arch=('x86_64')
license=('GPL2')
depends=('papirus-folders' 'qt6-base')
makedepends=('cmake' 'qt6-tools')
optdepends=('lxqt-policykit: option for polkit authentication agent'
            'lxsession-gtk3: option for polkit authentication agent'
            'mate-polkit: option for polkit authentication agent'
            'polkit-gnome: option for polkit authentication agent'
            'polkit-kde-agent: option for polkit authentication agent')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('c24246fc1f8af443e9f0e8f3e8138af4ac39caaa62ed05f22438039592ed0c0a')

build() {
  cmake -B build -S "$pkgname-$pkgver" \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -Wno-dev
  cmake --build build
}

package() {
  install -Dm755 "build/$pkgname" -t "$pkgdir/usr/bin"

  cd "$pkgname-$pkgver"
  install -Dm644 papirus.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 folder-logo.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
}
