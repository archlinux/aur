
_pkgname=minq-youtube
pkgname="${_pkgname}-git"
pkgver=r2.e3a4c1534e3ab5f399e2f80c5392d547185aa9fc
pkgrel=1
epoch=
pkgdesc='Browse youtube in your terminal. Automatically caches all network requests so that youtube can be enjoyed during an ISP outage.'
arch=(any)
url="https://github.com/kuche1/${_pkgname}.git"
license=('GPL')
depends=(python python-pytube python-climage yt-dlp)
makedepends=(git)
optdepends=()
provides=("${_pkgname}")
source=("git+$url")
md5sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse HEAD)"
}

package() {
	cd "${_pkgname}"
	mkdir -p "${pkgdir}/opt/${pkgname}"
	cp -rf * "${pkgdir}/opt/${pkgname}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	mkdir -p "${pkgdir}/usr/bin/"
	ln -s "/opt/${pkgname}/minq_youtube.py" "${pkgdir}/usr/bin/${_pkgname}"
}
