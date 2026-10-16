# Maintainer: dasbd72 <twbd723@gmail.com>
pkgname=dackel-launcher-bin
_name=dackel-launcher
pkgver=0.1.6
pkgrel=1
pkgdesc='Launch Windows games with Proton, with gamepad support (prebuilt binary)'
arch=('x86_64')
url='https://github.com/dasbd72/dackel-launcher'
license=('MIT')
depends=('glibc' 'hicolor-icon-theme' 'libgcc' 'systemd-libs' 'umu-launcher')
provides=("$_name=$pkgver")
conflicts=("$_name")
options=('!strip' '!debug')
# The binary is built once by the release workflow; the source archive supplies the menu
# entry, icon, metadata and license, which are the same files the source package installs.
source=("$_name-$pkgver-x86_64::$url/releases/download/v$pkgver/$_name"
        "$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('65f7917aeab5d8e17b755dc8178b343f10af9ed4d8b207b0f75bf9a3c1521e0c'
            '225b0eeb183c4a212ef026e05bd6129522c68afaf62c8129e60ffb0a44be0cbe')

package() {
  local appid=io.github.dasbd72.DackelLauncher
  install -Dm755 "$srcdir/$_name-$pkgver-x86_64" "$pkgdir/usr/bin/$_name"
  cd "$_name-$pkgver"
  install -Dm644 "packaging/$appid.desktop" "$pkgdir/usr/share/applications/$appid.desktop"
  install -Dm644 "packaging/$appid.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$appid.svg"
  install -Dm644 "packaging/$appid.metainfo.xml" "$pkgdir/usr/share/metainfo/$appid.metainfo.xml"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_name/LICENSE"
}
