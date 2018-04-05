# Maintainer: Joaquin Garmendia <joaquingc123 at gmail dot com>

# All my PKGBUILDs can be found in https://www.github.com/joaquingx/PKGBUILDs

pkgname=annie-git
pkgver=0.6.4.r17.ge975f14
pkgrel=1
arch=('x86_64' 'i686')
pkgdesc="A fast, simple and clean video downloader written in Go"
url="https://github.com/iawia002/annie"
license=("MIT")
makedepends=("go" "git")
depends=("ffmpeg")
provides=("annie")
conflicts=("annie")
source=("git+${url}")
sha256sums=("SKIP")
_gourl="github.com/iawia002/annie"

pkgver(){
    cd "${pkgname%-git}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare(){
	mkdir -p "$srcdir/src/github.com/iawia002/annie"
	cp -r "$srcdir/${pkgname%-git}/"{downloader,config,extractors,parser,request,static,utils,vendor} \
		"$srcdir/src/github.com/iawia002/annie"
}

build(){
	cd "${pkgname%-git}"
	GOPATH="$srcdir" go build
}

package(){
	install -Dm755 "${srcdir}/${pkgname%-git}/${pkgname%-git}" "${pkgdir}/usr/bin/${pkgname%-git}"
	install -Dm644 "${srcdir}/${pkgname%-git}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

