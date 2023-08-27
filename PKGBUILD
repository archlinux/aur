# Maintainer: griffin <19497824+WingofaGriffin@users.noreply.github.com>
_pkgname=itgmania
pkgname=itgmania-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="A fork of stepmania 5.1, improved for the post-ITG community"
provides=('itgmania')
conflicts=('itgmania')
arch=('x86_64')
url="https://www.itgmania.com/"
license=('MIT')
depends=(gtk3 ffmpeg libusb-compat lua glu)
source=(
	"https://github.com/$_pkgname/$_pkgname/releases/download/v${pkgver}/ITGmania-${pkgver}-Linux.tar.gz"
	"itgmania.sh"
)
sha256sums=('070d08abe20b51032af5630237916c25737afa717b24ac4db4a99f64777a09f5'
            '0249497c6eb7969362d8a93e1bb50c3259e5dc3873f8c94a40503d1321f03810')

package() {
	install -dm755 "${pkgdir}/opt/"
	cp -r "ITGmania-${pkgver}-Linux/$_pkgname" "${pkgdir}/opt/$_pkgname"
  	install -dm755 "${pkgdir}/usr/bin"
	install -D -m755 "$_pkgname.sh" "${pkgdir}/usr/bin/$_pkgname"
	install -D -m644 "ITGmania-${pkgver}-Linux/$_pkgname/$_pkgname.desktop" \
		"${pkgdir}/usr/share/applications/itgmania.desktop"

	# Install license
    install -Dm644 "ITGmania-${pkgver}-Linux/$_pkgname/Docs/Licenses.txt" "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

pkgver() {
	ITGMANIA_GITHUB_URL="https://api.github.com/repos/$_pkgname/$_pkgname/releases/latest"
  
  	itgManiaVer=$(curl --silent ${ITGMANIA_GITHUB_URL} | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/' | sed 's/v//')
  	if [ -z "$itgManiaVer" ]; then
    	itgManiaVer=$pkgver
  	fi
  	echo $itgManiaVer
}
