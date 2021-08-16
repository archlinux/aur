# Maintainer: michaelkuc6 <michaelkuc6 at gmail dot com>
_pkgname=zap
pkgname="${_pkgname}-git"
pkgver=1.3.0.r1.g7eeedaa
pkgrel=1
pkgdesc="Blazing fast web shortcuts."
arch=('x86_64')
url='https://github.com/issmirnov/zap'
license=('MIT')
backup=("etc/${_pkgname}/config.yml")
depends=()
makedepends=('go')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=(
	"${_pkgname}::git+https://github.com/issmirnov/zap.git"
	"${_pkgname}.service"
)
sha256sums=(
	'SKIP'
	'5ea62889f6649d308a3fe8b733258e781e59a07044dc282f7c082776db25a3e3'
)

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
	cd "${srcdir}/${_pkgname}"
	go build -o "${_pkgname}" -v ./cmd/
}

package() {
	install -D -m755 "${srcdir}/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	install -D -m644 "${srcdir}/zap.service" "${pkgdir}/etc/systemd/system/${_pkgname}.service"
	install -D -m644 "${srcdir}/${_pkgname}/c.yml" "${pkgdir}/etc/${_pkgname}/config.yml"
	install -D -m644 "${srcdir}/${_pkgname}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -D -m644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
