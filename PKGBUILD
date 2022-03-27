
_pkgname=minq-xvideos
pkgname="${_pkgname}-git"
pkgver=r38.46567547766896d77195f941be2e5e43197fd903
pkgrel=1
epoch=
pkgdesc='Explore xvideos in your terminal! Videos can be either played in the terminal or in any external video player. Undesirable videos can be blocked.'
arch=(any)
url="https://github.com/kuche1/${_pkgname}.git"
license=('GPL')
depends=(python python-beautifulsoup4 viu yt-dlp mplayer python-minq-caching-thing-git)
makedepends=(git)
optdepends=('wezterm: terminal that supports sixel'
            'vlc: an alternative video player')
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
	ln -s "/opt/${pkgname}/minq_xvideos.py" "${pkgdir}/usr/bin/${_pkgname}"
}
