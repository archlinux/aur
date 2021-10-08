# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=komanda-cli-git
pkgver=v0.9.4.r29.gb5ba03b
pkgrel=1
pkgdesc='The Komanda Command-line IRC Client'
arch=(x86_64)
url='https://github.com/mephux/komanda-cli'
license=(BSD)
makedepends=(go dep)
source=("${pkgname}::git+https://github.com/mephux/komanda-cli.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/${pkgname}"

	install -m755 -d "${srcdir}/go/src/github.com/mephux/"
	cp -a "${srcdir}/${pkgname}" "${srcdir}/go/src/github.com/mephux/komanda-cli"
}

build() {
	cd "${srcdir}/go/src/github.com/mephux/komanda-cli"

	export GOROOT="/usr/lib/go" GOPATH="${srcdir}/go"
	make
}

package() {
	cd "${srcdir}/go/src/github.com/mephux/komanda-cli"

	install -Dm755 bin/komanda "${pkgdir}"/usr/bin/komanda
	install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/komanda-cli/LICENSE
}
