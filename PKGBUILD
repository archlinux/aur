# Maintainer: Integral <integral@member.fsf.org>
# Maintainer: ston <2424284164@qq.com>

pkgname=boardmix-uos
pkgver=1.13.0
pkgrel=2
pkgdesc="Online collaborative whiteboard software."
arch=('x86_64')
url="https://boardmix.cn/"
license=('custom')
depends=('gtk3' 'nss' 'alsa-lib')
optdepends=('libappindicator-gtk3: Allow boardmix to extend a menu via Ayatana indicators in Unity, KDE or Systray (GTK+ 3 library).')
source=(
	"https://home-store-packages.uniontech.com/appstore/pool/appstore/c/cn.bosyun.boardmix/cn.bosyun.boardmix_${pkgver}_amd64.deb"
)
sha512sums=('24ed16f2652dc8dbebe2bb44ae4a200f5a6defdb7b297931c739edcee0a9e5b83b8aeb79ef48a4b4a0ee7e1b0d6e2c14f5a6bdf9ea446b0462b7dd21d2fcf366')

package() {
	echo "  -> Extracting the data.tar.xz..."
	bsdtar -xvf data.tar.xz -C "${pkgdir}/"
	chmod 755 -R "${pkgdir}/opt"

	echo "  -> Installing..."
	# Launcher
	install -Dm755 "${pkgdir}/opt/apps/cn.bosyun.boardmix/files/boardmix.sh" "${pkgdir}/usr/bin/${pkgname}"
	# Desktop Entry
	install -Dm644 "${pkgdir}/opt/apps/cn.bosyun.boardmix/entries/applications/cn.bosyun.boardmix.desktop" -t "${pkgdir}/usr/share/applications/"
	# License
	install -Dm644 "${pkgdir}/opt/apps/cn.bosyun.boardmix/files/LICENSE.electron.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
	install -Dm644 "${pkgdir}/opt/apps/cn.bosyun.boardmix/files/LICENSES.chromium.html" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
