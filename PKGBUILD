# Maintainer: Jonathan Keyuk <jonkero2 at gmail dot com>
basename=jvol
pkgname=${basename}-git
pkgver=1.0.r0.gc489846
pkgrel=1
pkgdesc="Pulse Audio TUI Volume Control"
arch=('x86_64')
url="https://github.com/Jkeyuk/Jvol"
license=('0BSD')
depends=('ncurses' 'libpulse')
makedepends=('git' 'cmake')
source=("${basename}::git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd "$basename"
  git describe --long --tags --abbrev=7 | sed 's/^V//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$basename"
    cmake -B build
    cmake --build build
}

package() {
	cd "$basename"
	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
