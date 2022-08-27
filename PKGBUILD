# Maintainer: Andrew Gregory Neumann <agneum14@gmail.com>
pkgname=4bulk-git
pkgver=1
pkgrel=3
pkgdesc="download all media from 4chan thread"
arch=('any')
url="https://github.com/agneum14/4bulk"
license=('MIT')
optdepends=('xclip')
depends=('python' 'python-beautifulsoup4' 'python-psutil' 'python-requests')
makedepends=('git')
source=($pkgname::git+$url)
md5sums=('SKIP')

build() {
	cd "$pkgname"
	echo '#!/bin/sh' > 4bulk
	echo python /usr/share/$pkgname/4bulk.py \$@ >> 4bulk
	chmod +x 4bulk
}

package() {
	cd $pkgname
	mkdir -p $pkgdir/usr/share/$pkgname
	mkdir -p $pkgdir/usr/bin/
	cp 4bulk.py $pkgdir/usr/share/$pkgname
	cp 4bulk $pkgdir/usr/bin/
	install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
	install -Dm644 README.md $pkgdir/usr/share/doc/$pkgname/README.md
}
