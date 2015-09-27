# Maintainer: Madara <majetree@yandex.ru>

pkgname=pixiecore
pkgver=2015.09.20.3a2c870
pkgrel=1
epoch=
pkgdesc="PXE booting for people in a hurry"
arch=('i686' 'x86_64')
url="https://github.com/danderson/pixiecore"
license=('GPL2')
groups=()
depends=()
makedepends=('go' 'git')
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
	git log -1 --format="%cd.%h" --date=short | sed 's/-/./g'
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
