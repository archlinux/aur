# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=litewrite-git
pkgver=50c014d
pkgrel=1
pkgdesc="Light weight web based note taking"
arch=('any')
url="http://github.com/litewrite/litewrite"
license=('AGPL')
makedepends=('nodejs-grunt-cli')
depends=('nodejs')
provides=(litewrite)
conflicts=(litewrite)
source=("litewrite::git+http://github.com/litewrite/litewrite"
				'litewrite.conf')
sha256sums=('SKIP'
						'0a084f866fa6f34d181cf4dd9def2e7106785e4107c71136d759d9d181ecf57f')

pkgver() {
  cd litewrite
  git describe --always | sed 's|-|.|g'
}

build() {
  cd "${srcdir}/litewrite"

	npm install
  grunt build
}

package() {
  cd "${srcdir}/litewrite"

	mkdir -p ${pkgdir}/usr/share/webapps/litewrite
	cp -rvf ./* ${pkgdir}/usr/share/webapps/litewrite/

	mkdir -p ${pkgdir}/etc/httpd/conf/extra
	cp ../litewrite.conf ${pkgdir}/etc/httpd/conf/extra
}

# vim: set ts=2 sw=2 ft=sh noet:
