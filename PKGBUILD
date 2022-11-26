# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=money
pkgver=2022.11.1
_commit=02e8ab5e9422e7690522ed496d6412e886488f0b # tag/v2022.11.1
pkgrel=1
pkgdesc='A personal finance manager'
arch=(x86_64)
url='https://github.com/nlogozzo/NickvisionMoney'
license=(GPL3)
depends=('gtk4>=4.8.0'
         'libadwaita>=1.2.0'
         jsoncpp
         sqlitecpp)
makedepends=(git meson gcc cmake boost)
checkdepends=(appstream-glib)
source=("$pkgname::git+$url#commit=$_commit")
sha256sums=('SKIP')

build() {
	arch-meson "$pkgname" build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	meson install -C build --destdir "$pkgdir"
}
