# Maintainer: Hoream <2175223953@qq.com>
_pkgname="go-musicfox"
pkgname="${_pkgname}-git"
pkgver=4.0.5.r2.ga294bde
_pkgver=4.0.2
pkgrel=1
pkgdesc='Command-line Netease Cloud Music written in Go (git version).'
url='https://github.com/anhoder/go-musicfox'
license=('MIT')
arch=('x86_64')
provides=('musicfox')
conflicts=('go-musicfox-bin' 'musicfox' 'go-musicfox')
depends=('flac' 'alsa-lib')
makedepends=('gcc-objc' 'go' 'git')
source=(${_pkgname}::git+https://github.com/go-musicfox/go-musicfox)
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^v//'
}

build(){
 	cd "${srcdir}/${_pkgname}"
    go mod download
    make
}


package() {
	install -d "${pkgdir}/usr/bin"
	install -d "${pkgdir}/usr/share/licenses/${_pkgname}"
	install -Dm755 "${srcdir}/${_pkgname}/bin/musicfox" "${pkgdir}/usr/bin/musicfox"
	install -Dm644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}"
}
