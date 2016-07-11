# Maintainer: Justin Dray <justin@dray.be>

pkgname=gnome-shell-extension-topicons-plus-git
pkgver=r70.1c158ee
pkgrel=1
pkgdesc="Shows legacy tray icons on top."
arch=('any')
url="https://extensions.gnome.org/extension/495/topicons/"
license=('GPL')
depends=('gnome-shell')
groups=('gnome-shell-extensions')
#source=("http://adel-dev.abaton.at/repo/topicons/snapshot/topicons-${pkgver}.tar.gz")
source=("git+https://github.com/phocean/TopIcons.git")
sha256sums=('SKIP')

pkgver() {
	cd "TopIcons"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd $srcdir/TopIcons
	make build
}

package() {
  cd "$srcdir/TopIcons"
  uuid=$(grep -Po '(?<="uuid": ")[^"]*' _build/metadata.json)
  destdir="$pkgdir/usr/share/gnome-shell/extensions/$uuid"

  install -dm755 $destdir

  cp -r _build/* $destdir
}
