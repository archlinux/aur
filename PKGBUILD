# Contributor: AlphaJack <alphajack at tuta dot io>
# Contributor: Asuka Minato

pkgname="teams-for-linux-electron-bin"
pkgver=1.3.8
pkgrel=1
pkgdesc="Unofficial Microsoft Teams for Linux client (binary version)"
url="https://github.com/IsmaelMartinez/teams-for-linux"
license=("GPL3")
arch=("x86_64" "aarch64" "armv7h")
provides=("teams-for-linux")
conflicts=("teams-for-linux"
	"teams-for-linux-appimage"
	"teams-for-linux-git"
	"teams-for-linux-wbundled-electron"
)
depends=("electron24" "bash")
source_x86_64=("$url/releases/download/v$pkgver/teams-for-linux_${pkgver}_amd64.deb")
source_aarch64=("$url/releases/download/v$pkgver/teams-for-linux_${pkgver}_arm64.deb")
source_armv7h=("$url/releases/download/v$pkgver/teams-for-linux_${pkgver}_armv7l.deb")
sha256sums_x86_64=('36ac437c268d5ba626259da11edba7df58cc23d158f3de61008985bf48e4481c')
sha256sums_aarch64=('6107331680929d80d220cf5f5636804b05014ee1638a69d41cc62411d53d83c0')
sha256sums_armv7h=('ec54769eacc041221d8a3d7c678595ac0e433376e68ff0c01fcb0c5a233633bc')
options=("!strip")

package() {
	tar -xf "data.tar.xz" -C $pkgdir
	find "$pkgdir"/opt -type f -not -path "*resources/*" -delete
	find $pkgdir -name "*.desktop" -exec sed -i -r "s!^Exec=.*!Exec=electron24 /opt/teams-for-linux/resources/app.asar!" {} \;
}
