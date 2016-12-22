#Maintainer: "Kirk Gleason <kirk at kirkg dot us>"
pkgname=lightum-git
pkgver=2.3.1
pkgrel=1
pkgdesc="Lightum is a daemon to control the keyboard brightness and screen backlight on MacBook based laptops."
arch=(i386 x86_64)
depends=(dbus glib2 libsystemd libx11 libxext libxss glibc)
url="https://github.com/poliva/lightum"
license=('GPL2')
md5sums=(SKIP)
#source=('lightum-git::git+https://github.com/poliva/lightum.git')
source=('lightum-git::git://github.com/poliva/lightum.git')
pkgver() {
	cd "$pkgname"
	git describe --always | sed 's|v||;s|-.*||'
}

prepare() {
	cd "$pkgname"
    patch -p1 -i ../../lightum-git.diff
}

build() {
	cd "$pkgname"
	make
}

check() {
	cd "$pkgname"
	true
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir/" install
}