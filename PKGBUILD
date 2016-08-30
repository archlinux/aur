# Submitter: Fredrik Strandin <fredrik@strandin.name>
# Maintainer: Fredrik Strandin <fredrik@strandin.name>

pkgname=mop
pkgver=0.2.0
pkgrel=2
pkgdesc='Stock market tracker for hackers'
arch=('i686' 'x86_64')
url='https://github.com/michaeldv/mop'
license=('MIT')

depends=('glibc')
makedepends=('go' 'godep')
source=("https://github.com/mop-tracker/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('cf11ce0967fc02aa6ed7852866973aeb66d2e5729ca1fe7997d9d58d64d8e04a')

prepare() {
	mkdir -p ${srcdir}/src/github.com/michaeldv
	mkdir -p ${srcdir}/bin
	rm -rf ${srcdir}/github.com/michaeldv/${pkgname}
	mv --no-target-directory ${srcdir}/${pkgname}-${pkgver} ${srcdir}/src/github.com/michaeldv/${pkgname}
}

build() {
	export GOPATH=${srcdir}

	cd ${srcdir}/src/github.com/michaeldv/${pkgname}
	go get -v
	make build
}

package() {
	install -Dm755 ${srcdir}/src/github.com/michaeldv/${pkgname}/${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
