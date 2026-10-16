# Maintainer: dasbd72 <twbd723@gmail.com>
pkgname=dackel-launcher-bin
_name=dackel-launcher
pkgver=0.1.4
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
sha256sums=('f58887812d170748244c25e53b6e6a82a6c670a397430e4e8b1c0b7ce31ad864'
            '14bc86e1e63df526e747b902c3b5f19802e742a110298d184534abeedc42b68a')

package() {
  local appid=io.github.dasbd72.DackelLauncher
  install -Dm755 "$srcdir/$_name-$pkgver-x86_64" "$pkgdir/usr/bin/$_name"
  cd "$_name-$pkgver"
  install -Dm644 "packaging/$appid.desktop" "$pkgdir/usr/share/applications/$appid.desktop"
  install -Dm644 "packaging/$appid.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$appid.svg"
  install -Dm644 "packaging/$appid.metainfo.xml" "$pkgdir/usr/share/metainfo/$appid.metainfo.xml"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_name/LICENSE"
}
