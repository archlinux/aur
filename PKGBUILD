# Maintainer: Ujhhgtg <feyxiexzf@gmail.com>

pkgname=gnome-shell-extension-gsconnect-g43-git
pkgver=56.3
pkgrel=1
pkgdesc="Temporary fix for GNOME 43 for GSConnnect (MacTavishAO's fork)"
arch=('any')
url="https://github.com/MacTavishAO/gnome-shell-extension-gsconnect"
license=('GPL')
groups=()
depends=('gnome-shell')
optdepends=(
  'folks: Contacts integration (Evolution)'
  'libgdata: Contacts integration (GNOME Online Accounts)'
  'python-nautilus: Nautilus integration'
  'gsound: Themed sound effects'
)
makedepends=('git' 'meson' 'eslint')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=()
install=
source=('git+'${url})
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g;s/rc.\.//'
}


build() {
  cd "$srcdir/${pkgname%-git}"

  arch-meson --buildtype=plain build
  ninja -C build
}

check() {
  cd "$srcdir/${pkgname%-git}"
  arch-meson check 
}

package() {
  cd "$srcdir/${pkgname%-git}"
  DESTDIR="$pkgdir" ninja -C build install
}
