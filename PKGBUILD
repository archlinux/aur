# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=hardlinkpy-hg
pkgver=0.1be1ba7ea389
pkgrel=1
pkgdesc='a tool to hardlink together identical files in order to save space'
arch=('any')
url='https://code.google.com/p/hardlinkpy/'
license=('GPL2')
depends=('python2')
makedepends=('mercurial')
provides=('hardlinkpy')
conflicts=('hardlinkpy')
source=('hg+https://code.google.com/p/hardlinkpy/')
sha256sums=('SKIP')

pkgver() {
	cd hardlinkpy/

	hg tip | head -n1 | tr -d ' ' | cut -d: --output-delimiter=. -f 2,3
}

package() {
	cd hardlinkpy/

	sed -i '1c #!/usr/bin/python2' hardlink.py

	install -D -m0755 hardlink.py "${pkgdir}/usr/bin/hardlink.py"
	install -D -m0644 COPYING "${pkgdir}/usr/share/licenses/hardlinkpy/COPYING"
}

