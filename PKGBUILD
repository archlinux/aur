# Maintiner  : David Phillips < dbphillipsnz gmail >
# Contributor: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

_pkgname=blind
pkgname=${_pkgname}-git
pkgver=1.1.r140.g7fd0d92
pkgrel=1
pkgdesc="Suckless command line video editor"
arch=('x86_64' 'i686')
url="https://tools.suckless.org/blind/"
license=('custom:ISC')
depends=('ffmpeg')
optdepends=('imagemagick: support for other images formats than farbfeld and PAM')
makedepends=('git')
source=("${pkgname}::git+https://git.suckless.org/${_pkgname}")
sha256sums=('SKIP')

pkgver() {
	cd "${pkgname}"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${pkgname}"
	make PREFIX=/usr
}

package() {
	cd "${srcdir}/${pkgname}"
	make install PREFIX=/usr DESTDIR="${pkgdir}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
