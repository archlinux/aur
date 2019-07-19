# $Id: PKGBUILD 103944 2014-01-13 20:31:53Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=nextcloud-app-maps
pkgver=r865.58b6a66
pkgver() {
	cd "$srcdir/maps"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgrel=1
pkgdesc="OpenStreetMap layers including POIs"
arch=('any')
url="https://github.com/nextcloud/maps"
license=('GPL')
depends=('nextcloud')
makedepends=('git' 'rsync')
options=('!strip')
source=("git+https://github.com/nextcloud/maps.git#branch=rework-eneiluj")
sha256sums=('SKIP')

build() {
	cd maps
	echo | make
}

package() {
	install -d "${pkgdir}"/usr/share/webapps/nextcloud/apps
	rsync -a \
	--exclude=.git \
	--exclude=build \
	--exclude=tests \
	--exclude=Makefile \
	--exclude=*.log \
	--exclude=phpunit*xml \
	--exclude=composer.* \
	--exclude=js/node_modules \
	--exclude=js/tests \
	--exclude=js/test \
	--exclude=js/*.log \
	--exclude=js/package.json \
	--exclude=js/bower.json \
	--exclude=js/karma.* \
	--exclude=js/protractor.* \
	--exclude=package.json \
	--exclude=bower.json \
	--exclude=karma.* \
	--exclude=protractor\.* \
	--exclude=translationfiles \
	--exclude=.* \
	--exclude=js/.* \
	"${srcdir}"/maps "${pkgdir}"/usr/share/webapps/nextcloud/apps/
}
