# Maintainer: Integral <integral@murena.io>

pkgname=shimo-bin
_pkgname=${pkgname%-bin}
pkgver=3.3.1
pkgrel=2
pkgdesc="石墨文档 Shimo document (An online collaborative office software)."
arch=('x86_64' 'aarch64')
url="https://shimo.im/"
license=('custom')
depends=('nss' 'alsa-lib' 'java-runtime' 'libnet' 'gtk3' 'libxkbcommon-x11')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("https://oas.shimonote.com/panther/${_pkgname}/release/linux/x64/${_pkgname}_v${pkgver}-release.ea23524.shimo_linux-amd64.deb")
source_aarch64=("https://oas.shimonote.com/panther/${_pkgname}/release/linux/arm64/${_pkgname}_v${pkgver}-release.ea23524.shimo_linux-arm64.deb")
sha512sums_x86_64=('8ea8a82a17d8128e4ed7421bb42e194421264ff630c9d3f648cb85796f7dfe3b2e83f58873bff704345abcbbad87e610455db352c8b8ef7aa55ddcee5b78af16')
sha512sums_aarch64=('1f042280754be9d9732844ea1180abca93b3a3ac357418a98ef3394b78fc97ac2c5330ae229b3ea650b2c3506a49ee88efc67f493ac6fe440f47516e27952f3a')

package() {
	echo "  -> Extracting the data.tar.gz..."
	bsdtar -xvf data.tar.gz -C "${pkgdir}/"
	chmod -R 755 "${pkgdir}/"

	echo "  -> Installing..."

	# Launcher
	mkdir -p "${pkgdir}/usr/bin/"
	ln -s "/opt/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	# License
	install -Dm644 "${pkgdir}/opt/shimo/LICENSE.electron.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
	install -Dm644 "${pkgdir}/opt/shimo/LICENSES.chromium.html" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
