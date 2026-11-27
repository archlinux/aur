# Maintainer: krforshey
pkgname=cosmic-applet-manager-bin
_pkgname=cosmic-applet-manager
pkgver=0.3.0
pkgrel=1
pkgdesc='Browse, install, update and remove community COSMIC extensions (prebuilt binary)'
arch=('x86_64')
url='https://github.com/kevinRForshey/CosmicAppletManager'
license=('Apache-2.0')
# git, just and a Rust toolchain are needed at runtime: extensions are built from source.
depends=('git' 'just' 'rust' 'libxkbcommon' 'wayland' 'vulkan-icd-loader' 'fontconfig')
optdepends=('flatpak: sandboxed installs (the default)' 'flatpak-builder: sandboxed installs (the default)' 'python: sandboxed installs and Flatpak packaging')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip')
source=("$url/releases/download/v$pkgver/$_pkgname-v$pkgver-x86_64-linux.tar.gz")
sha256sums=('91a3e21045f4229760683e058c34cfe10987c8516c2db9139ae8d9155763c13f')

package() {
  cd "$_pkgname-v$pkgver-x86_64-linux"
  install -Dm0755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm0644 res/io.github.kevinRForshey.CosmicAppletManager.desktop -t "$pkgdir/usr/share/applications"
  install -Dm0644 res/io.github.kevinRForshey.CosmicAppletManager.metainfo.xml -t "$pkgdir/usr/share/metainfo"
  install -Dm0644 res/io.github.kevinRForshey.CosmicAppletManager.svg -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
