# Maintainer: leogx9r
pkgname=gtk-theme-windows10-dark-git
pkgver=7f2121c
pkgrel=1
pkgdesc="GTK 3.x Theme made to emulate a Windows 10 environment on Linux machines. Keeps upstream with master branch."
arch=('any')
license=('GPL')
depends=('gtk-engine-murrine')
themename=Windows-10-Dark
url="https://github.com/B00merang-Project/Windows-10-Dark"
source=("${themename}::git+https://github.com/B00merang-Project/Windows-10-Dark.git#branch=master"
	"taskbar.patch")
sha1sums=('SKIP'
          'b76d10fb8e8c1e132715b4aca62d1ffd37e2a908')

pkgver() {
	cd "${themename}"
	git rev-parse --short HEAD
}

package() {
  	install -d -m 755 "$pkgdir/usr/share/themes/${themename}"

	cd "${themename}"
	
	git apply "${srcdir}/taskbar.patch"
	rm -rf ".git"

  	find . -type f -exec install -D -m 644 '{}' "$pkgdir/usr/share/themes/${themename}/{}" \;
}
