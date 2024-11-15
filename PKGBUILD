# Contributor: Devin Hill lvlrk4u@proton.me

pkgname=unpac
pkgver=1.5
pkgrel=2
pkgdesc="An epic Namco Museum Remix modding tool"
arch=('x86_64')
url="https://github.com/lvlrk/unpac"
license=('GPL-3.0-or-later')
depends=('gcc-libs')
makedepends=('git')
source=("git+${url}.git#commit=09c0944c428969cf95f420836340dec743521170"
        "makefile.patch")
sha256sums=('7a81698493eeb09a44cabffe0a5723ac06c26354463fc484d26f3b2a99f4c632'
            '5286140f91bcbc4a5fb6fac59eec0c7b508ae1906f9184a89f355753cf299db7')

prepare() {
	patch -d "$pkgname" -p1 < makefile.patch
}

build() {
	cd "$pkgname"
	make all libunpac
}

package() {
	cd "$pkgname"
	# make install
	install -Dm755 unpac -t "$pkgdir/usr/bin"
	# make install-lib
	install -Dm644 include/*.h -t "$pkgdir/usr/include/unpac"
	install -Dm755 libunpac.so -t "$pkgdir/usr/lib"
}
