# Maintainer: dtluna <dtluna at waifu dot club>

pkgname='emoji-stealer'
_pkgname='emoji_stealer'
pkgver='1.1.0'
pkgrel=3
pkgdesc='Emoji stealer for Mastodon and Pleroma'
url='https://git.dtluna.net/dtluna/emoji_stealer'
arch=('any')
license=('custom:WTFPL')

depends=()
makedepends=('go')
optdepends=()

conflicts=('emoji-stealer-bin')

source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('f38fcffc6eb1e10fcfde8af9a450c0f1aa2e095b56bc527630cff5e05e2b7194')

build() {
    cd $srcdir/$_pkgname
    go build -o $pkgname
}

package() {
	# Bin
	rm -f "${pkgdir}/usr/bin/${pkgname}"
	install -Dm755 "${srcdir}/${_pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	# License
	install -Dm644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
