# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Jagadeesh Kotra <jagadeesh at stdin dot top>

pkgname=eovpn
pkgver='1.33'
pkgrel=1
pkgdesc='Application to connect, manage and update OpenVPN configurations'
arch=('x86_64')
url='https://github.com/jkotra/eOVPN'
license=('GPL3')
depends=('gtk4' 'libadwaita' 'python' 'networkmanager' 'libsecret' 'libnotify' 'networkmanager-openvpn' 'python-gobject')
optdepends=('openvpn3')
makedepends=('gobject-introspection' 'meson' 'python-cffi')
source=("https://github.com/jkotra/eOVPN/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('24d899d9e1f1364ee45392bec02fa82c6caab76e114d59337a18c0d9d73a9675')

build() {
  if command -v openvpn3 > /dev/null; then
  	echo "building with openvpn3 support!"
  	arch-meson eOVPN-$pkgver build -Dopenvpn3=true
  else
  	arch-meson eOVPN-$pkgver build
  fi
  
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
