# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=money
pkgver=2022.10.0
_commit=a9181a48b0fa333de79a4f1e856471b0d7fef209 # tag/v2022.10.0
pkgrel=1
pkgdesc='A personal finance manager'
arch=(x86_64)
url='https://github.com/nlogozzo/NickvisionMoney'
license=(GPL3)
depends=('gtk4>=4.8.0'
         'libadwaita>=1.2.0'
				 jsoncpp
				 sqlitecpp
				 boost)
makedepends=(git meson gcc cmake)
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
