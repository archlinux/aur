# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Jagadeesh Kotra <jagadeesh at stdin dot top>

pkgname=eovpn
pkgver='1.30'
pkgrel=3
pkgdesc='Application to connect, manage and update OpenVPN configurations'
arch=('x86_64')
url='https://github.com/jkotra/eOVPN'
license=('GPL3')
depends=('gtk4' 'python' 'networkmanager' 'libsecret' 'libnotify' 'networkmanager-openvpn' 'python-gobject')
optdepends=('openvpn3')
makedepends=('gobject-introspection' 'meson' 'python-cffi')
source=("https://github.com/jkotra/eOVPN/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('b356df78d629081f4bcd21f66b7e6458b289a966c898acbacc036f21a5d7bbcf')

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
