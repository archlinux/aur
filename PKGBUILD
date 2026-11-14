# Maintainer: TheElevatedOne <adam.mlady@elevated.ovh>

pkgname=lib32-reshade-linux-bin
_pkgname=reshade-linux
pkgver=6.8.0.1
pkgrel=1
pkgdesc="crosire's ReShade post-processing injector as a native Vulkan layer (32-bit) (prebuilt)"
arch=('x86_64')
url='https://github.com/TheElevatedOne/reshade-linux'
license=('BSD-3-Clause')
# reshade-linux has the reshade launcher and the desktop entry the global shortcuts portal needs.
depends=('reshade-linux' 'lib32-glibc' 'lib32-libxcb' 'lib32-libxkbcommon' 'lib32-wayland' 'lib32-dbus' 'lib32-vulkan-icd-loader')
provides=("lib32-$_pkgname=$pkgver")
conflicts=("lib32-$_pkgname")
# The release binaries are built on Arch Linux by the GitHub workflow and already stripped.
options=('!debug' '!strip')
# Release tags have no "v" prefix: "<ReShade version>.<release of this port>".
source=("$url/releases/download/$pkgver/$_pkgname-$pkgver-x86.tar.gz")
sha256sums=('b6b471aa213a835917beeaf329c9ffecfb3c4b45e19e369264ba44d4b9a64c8e')

package() {
  cd "$_pkgname-$pkgver-x86"
  install -Dm755 lib32/reshade/libreshade.so -t "$pkgdir/usr/lib32/reshade"
  # Vulkan layer manifest for 32-bit games
  install -Dm644 share/vulkan/implicit_layer.d/reshade.x86.json -t "$pkgdir/usr/share/vulkan/implicit_layer.d"
  install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname"
}
