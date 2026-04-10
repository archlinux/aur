# Maintainer: Evan Purkhiser <evanpurkhiser@gmail.com>

pkgname=things3-cloud-bin
pkgver=0.7.1
pkgrel=1
pkgdesc="Command-line client for Things 3 using the Things Cloud API (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/evanpurkhiser/things3-cloud"
license=('MIT')
depends=('glibc' 'gcc-libs')
provides=("things3-cloud=${pkgver}")
conflicts=('things3-cloud')
source=("LICENSE::https://raw.githubusercontent.com/evanpurkhiser/things3-cloud/v${pkgver}/LICENSE")
source_x86_64=("things3-linux-amd64::https://github.com/evanpurkhiser/things3-cloud/releases/download/v${pkgver}/things3-linux-amd64")
source_aarch64=("things3-linux-arm64::https://github.com/evanpurkhiser/things3-cloud/releases/download/v${pkgver}/things3-linux-arm64")
sha256sums=('8d46b8b792405bf7c37e14a1825649a9013f999e595f9fbe68b4aea7ab098bd5')
sha256sums_x86_64=('bd63e93325b002c7251e4b7acc80171ccc49eef467ac97868e154e26cbca1e8c')
sha256sums_aarch64=('31cd073ee77a1ff1d1a8c14a0e8171ac79b45dcbb7c9a64b989c13728fc90536')

package() {
	local _bin
	case "${CARCH}" in
		x86_64) _bin="things3-linux-amd64" ;;
		aarch64) _bin="things3-linux-arm64" ;;
		*) printf 'Unsupported architecture: %s\n' "${CARCH}" >&2; return 1 ;;
	esac

	install -Dm755 "${srcdir}/${_bin}" "${pkgdir}/usr/bin/things3"
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
