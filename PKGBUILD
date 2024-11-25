# Maintainer: Mohamed Elsayed <mohamed@devlix.org>
pkgname=smbmnt
pkgver=r9.1f24685
pkgrel=6
pkgdesc="Mount samba shares on Linux easily."
arch=("x86_64")
url="https://github.com/Mohamed1242012/smbmnt"
license=('GPL')
depends=('sudo' 'yq' 'util-linux' 'cifs-utils')
makedepends=('git')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}


build() {
	cd "$pkgname"
}

package() {
	cd "$pkgname"
	mkdir -p ~/.config/smbmnt
	install -Dm755 ./smbmnt "$pkgdir/usr/bin/smbmnt"
	if [ ! -f "$HOME/.config/smbmnt/config.yaml" ]; then
    install -Dm755 ./config.yaml "$HOME/.config/smbmnt/config.yaml"
	fi
	install -Dm644 ./README.md "pkgdir/usr/share/doc/smbmnt/README.md"
  install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/smbmnt/LICENSE"
}
