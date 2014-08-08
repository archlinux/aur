# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=nova-xvpvncviewer-git
pkgver=fc29208
pkgrel=1
pkgdesc="Java vnc viewer for Openstack Nova"
arch=(any)
url="https://github.com/cloudbuilders/nova-xvpvncviewer"
license=(GPL)
depends=(java-runtime)
makedepends=(git)

source=('git://github.com/cloudbuilders/nova-xvpvncviewer.git' xvpvncviewer)
sha256sums=('SKIP'
            'a6d5c21bf2ffe8c2e2e3b0894fd3e1c64c330ca541e66f35391e20191ec95608')

pkgver() {
	cd "$srcdir"/nova-xvpvncviewer
	git describe --tags --always | sed 's|-|.|g'
}

build() {
	cd "$srcdir"/nova-xvpvncviewer/viewer
	make all
}

package() {
	cd "$srcdir"/nova-xvpvncviewer/viewer
	install -Dm644 VncViewer.jar "$pkgdir"/usr/share/xvpvncviewer/VncViewer.jar
	install -Dm755 "$srcdir"/xvpvncviewer "$pkgdir"/usr/bin/xvpvncviewer
}
