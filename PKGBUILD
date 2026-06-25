# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=drunkleen
_pkgname=leenfetch
pkgname=${_pkgname}-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="Fast, minimal, customizable system info tool in Rust (Neofetch alternative)"
arch=('x86_64' 'aarch64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('libx11' 'libxrandr' 'glibc' 'gcc-libs')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md"
        "MAN-${pkgver}.1::${_urlraw}/leenfetch.1")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-${arch[0]}.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-${arch[1]}.tar.gz")
sha256sums=('e673ac9666ad19db4dceaac6e42e8b0c3e9e86b1911e6877bb6ee7f3f31565ee'
            'c30c3e23f985ac8b0a08480e14af7ca839d76824cbd7d94a31c1ad77ad885c53'
            '569bf43c3ae111eda9f88d1e64d540551253f8592dea7811d3227d73aa05b32c')
sha256sums_x86_64=('29fe4a5630fda72d9bdbd29185708cdf6002050c0a70814b5af3dbd6dc37c0f7')
sha256sums_aarch64=('3d6eefc3cb530e58c5990aa16d8a05873a93fb52ce2e2e99ee534c8420f22a15')

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "MAN-${pkgver}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
	gzip "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
}
