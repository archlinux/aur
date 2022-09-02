# Maintainer : Mustafa Ibrahim <h9s@tutanota.com>

pkgname=gitwatch-git
_pkgname="gitwatch"
pkgrel=1
pkgdesc="A bash script to watch a file or folder and commit changes to a git repo"
arch=('any')
url="https://github.com/gitwatch/gitwatch"
license=('GPL3')
source=(git+https://github.com/gitwatch/gitwatch)
depends=('git' 'inotify-tools')
pkgver=0.1.r58.gf895a5d
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	sed -i 's|/usr/local/bin/|/usr/bin/|' gitwatch/gitwatch@.service
}

package() {
	install -Dm 755 gitwatch/gitwatch.sh "$pkgdir/usr/bin/gitwatch"
	install -Dm 644 gitwatch/gitwatch@.service \
		"$pkgdir/usr/lib/systemd/user/gitwatch@.service"
}
