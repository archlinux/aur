# Maintainer: NWHirschfeld <aur@nwhirschfeld.de>

_pkgname=i3icons2
pkgname=${_pkgname}-git
pkgver=20181213.27ee9d8
pkgrel=1
pkgdesc='go version of i3icons - native deamon to rename workspaces with fontawesome-icons based on open applications'
url='https://github.com/nwhirschfeld/i3icons2'
arch=('i686' 'x86_64' 'armv7h' 'armv6h')
depends=('glibc')
license=('custom:MIT')
makedepends=('git' 'go')
source=("${_pkgname}::git+https://github.com/nwhirschfeld/i3icons2.git")
sha1sums=('SKIP')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

prepare() {
	cd "${srcdir}/${_pkgname}"
	make get
}

build() {
	cd "${srcdir}/${_pkgname}"
	make
}

#check() {
#	cd "${srcdir}/${_pkgname}"
#	./2048 test
#}

package() {
	cd "${srcdir}/${_pkgname}"
	install -Dm755 bin/i3icons2 "${pkgdir}/usr/bin/i3icons2"
	install -Dm644 icons.config "${pkgdir}/etc/i3icons2.config"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
