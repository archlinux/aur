# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=gnome-shell-extension-activate-gnome-git
pkgver=r6.93a4184
pkgrel=1
pkgdesc="A gnome-shell extension to show 'Activate Gnome' watermark"
arch=(any)
url=https://github.com/isjerryxiao/gnome-shell-extension-activate-gnome
license=(GPL3)
depends=(gnome-shell)
makedepends=(git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
md5sums=(SKIP)

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"

	_installbase="$pkgdir/usr/share/gnome-shell/extensions"
	_extensionname='activate_gnome@isjerryxiao'
	install -d "$_installbase"
	cp -a "$_extensionname" "$_installbase"
}
