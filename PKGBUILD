# Maintainer: fatuus
pkgname=dotfiles-installer-git
pkgver=0.9.4.2.gdcc137b
pkgrel=1
pkgdesc="Install dotfiles easy, fast and secure."
arch=('any')
url="https://github.com/mylinuxforwork/dotfiles-installer"
license=('GPL3')
depends=('glibc')
makedepends=('meson' 'ninja' 'gcc' 'git')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')  # Replace with actual checksum later

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --tags --always | sed "s/^v//;s/-/./g"
}

build() {
  cd "$srcdir/$pkgname"
  meson setup build --prefix=/usr
  meson compile -C build
}

package() {
  cd "$srcdir/$pkgname"
  DESTDIR="$pkgdir" meson install -C build
  # Remove file that conflicts with pinta package
  rm -f "$pkgdir/usr/share/icons/hicolor/scalable/actions/help-website-symbolic.svg"
}
