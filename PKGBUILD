# Maintainer:Integral<luckys68@126.com>
# Maintainer:ston<2424284164@qq.com>
pkgname=kdocs-uos
pkgver=3.5.2
pkgrel=1
pkgdesc="金山文档 Kingsoft documents (An online collaborative office software)."
arch=('x86_64')
url="https://www.kdocs.cn/"
license=('custom')
depends=('nss' 'alsa-lib' 'gtk3' 'dpkg')
optdepends=(
  'pulseaudio: A featureful, general-purpose sound server.'
  'lib32-libpulse: A featureful, general-purpose sound server (32-bit client libraries).'
  'gnome-keyring: Stores passwords and encryption keys.'
  'lsb-release: LSB version query program.'
)
source=(
  "https://home-store-packages.uniontech.com/appstore/pool/appstore/c/cn.kdocs.kdesktop/cn.kdocs.kdesktop_${pkgver}_amd64.deb"
)
sha512sums=('2a2762726ee09bdecbc256bf9d4f4be4ad89d3915025c8110ad0e86c0af4f32238748949e341c81617d8a1170f9071955e7688f4cd9abd8956f216d192d1bdbc')

package() {
	echo "  -> Extracting the data.tar.xz..."
	bsdtar -xvf data.tar.xz -C "${pkgdir}/"
	chmod -R 755 "${pkgdir}/opt/"
	echo "  -> Installing..."

	# Launcher
  mkdir -p "${pkgdir}/usr/bin/"
  ln -s "/opt/apps/cn.kdocs.kdesktop/files/bin/kdesktop" "${pkgdir}/usr/bin/${pkgname}"
	# Desktop Entry
	install -Dm644 "${pkgdir}/opt/apps/cn.kdocs.kdesktop/entries/applications/cn.kdocs.kdesktop.desktop" -t "${pkgdir}/usr/share/applications/"
	# License
	install -Dm644 "${pkgdir}/opt/apps/cn.kdocs.kdesktop/files/lib/kdesktop/LICENSE.electron.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
	install -Dm644 "${pkgdir}/opt/apps/cn.kdocs.kdesktop/files/lib/kdesktop/LICENSES.chromium.html" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
