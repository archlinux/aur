# Maintainer: Daniel Martí <mvdan@mvdan.cc>

pkgname=fdroidcl
_name="${pkgname}"
pkgver=0.5.0
pkgrel=2
pkgdesc="F-Droid desktop client"
url="https://github.com/mvdan/${_name}"
license=('BSD')
arch=('i686' 'x86_64')
depends=('android-tools')
makedepends=('git' 'go')
source=("git+${url}#tag=v${pkgver}")
sha1sums=('SKIP')

build() {
	cd "${srcdir}/${_name}"
	GO111MODULE=on go build -trimpath -ldflags='-s -w'
}

package() {
	cd "${srcdir}/${_name}"
	install -Dm755 "${_name}" "${pkgdir}/usr/bin/${_name}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 contrib/completion/zsh/_fdroidcl "${pkgdir}/usr/share/zsh/vendor-completions/_fdroidcl"
}
