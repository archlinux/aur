# Contributor: Rorschach <r0rschach@lavabit.com>
# Contributor: Andrew Kravchuk <awkravchuk@gmail.com>
# Contributor: aericson <de.ericson@gmail.com>

pkgname=aarchup
pkgver=1.7.3
pkgrel=3
pkgdesc="Fork of archup a small and lightweight update-notifier for archlinux."
url="https://github.com/aericson/aarchup"
arch=('i686' 'x86_64')
license="GPL"
depends=('pacman' 'libnotify' 'gtk2')
makedepends=('libnotify' 'autoconf' 'gzip')
source=("https://github.com/aericson/aarchup/archive/$pkgver.zip")
md5sums=('89e1e830cb9b10ee29bb561ad3c3cde9')
backup=('etc/systemd/system/aarchup.timer')
optdepends=('cower: AUR support(--aur)')
install='aarchup.install'

prepare() {
	mv -v $pkgname-$pkgver/src/* $pkgname-$pkgver/
    rmdir $pkgname-$pkgver/src
}

build() {
	cd $pkgname-$pkgver/
	autoconf || return 1
	./configure --prefix=/usr || return 1
	make || return 1
}

package() {
	cd $pkgname-$pkgver/
	make DESTDIR="$pkgdir/" install || return 1
}
