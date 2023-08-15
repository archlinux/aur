# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=gnome-shell-extension-just-perfection-desktop
pkgver=26
_commit=a0877bed45d78b9d33ec22d805ba35d60089fd41
pkgrel=1
pkgdesc='Just Perfection GNOME Shell Desktop'
arch=(any)
url=https://gitlab.gnome.org/jrahmatzadeh/just-perfection
license=(GPL3)
depends=(gnome-shell)
makedepends=(git)
source=("$pkgname::git+$url.git#commit=$_commit")
md5sums=(SKIP)

build() {
	cd "$pkgname"
	bash scripts/build.sh
}

package() {
	cd "$pkgname"
	_extensiondir="/usr/share/gnome-shell/extensions/just-perfection-desktop@just-perfection"
	install -d "$pkgdir$_extensiondir"
	bsdtar -x -f just-perfection-desktop@just-perfection.shell-extension.zip -C "$pkgdir$_extensiondir"
	install -Dm644 src/schemas/org.gnome.shell.extensions.just-perfection.gschema.xml -t "$pkgdir/usr/share/glib-2.0/schemas"
}
