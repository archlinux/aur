# Maintainer: Madara <majetree@yandex.ru>

pkgname=pixiecore
pkgver=15.09.20.1320
pkgrel=1
epoch=
pkgdesc="PXE booting for people in a hurry"
arch=('any')
url="https://github.com/danderson/pixiecore"
license=('GPL2')
groups=()
depends=()
makedepends=('go' 'git>=2.6')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git://github.com/danderson/pixiecore.git")
noextract=()
md5sums=('SKIP')
#validpgpkeys=()


pkgver() {
	cd "${srcdir}/${pkgname}"
	git log -1 --format="%cd" --date=format:"%y.%m.%d.%H%M"
}

build() {
	cd "${srcdir}/${pkgname}"
	rm -rf "${srcdir}/.go/src"
	mkdir -p "${srcdir}/.go/src"
	export GOPATH="${srcdir}/.go"
	mv "${srcdir}/${pkgname}" "${srcdir}/.go/src/"
	cd "${srcdir}/.go/src/${pkgname}/"
	ln -sf "${srcdir}/.go/src/${pkgname}/" "${srcdir}/${pkgname}"

	echo "Running 'go get' ..."
	go get
}

package() {
	install -DT "${srcdir}/.go/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
