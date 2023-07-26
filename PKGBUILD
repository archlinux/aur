# Contributor: AlphaJack <alphajack at tuta dot io>
# Contributor: Asuka Minato

pkgname="teams-for-linux-electron-bin"
pkgver=1.2.8
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
sha256sums_x86_64=('ddd6ec586a232ae6ebb5c4df7ffcc426ab6911599164eda4966e7bdbc7978f81')
sha256sums_aarch64=('40878261b2e48107946191d45f2c227b98981954eec521cb0f5760a22ca0c5f9')
sha256sums_armv7h=('3f97167d06c91c9a0ca4dc84906f8e08c54b8c5465cf22ea27de2e9b8b9be71a')
options=("!strip")

package() {
	tar -xf "data.tar.xz" -C $pkgdir
	find "$pkgdir"/opt -type f -not -path "*resources/*" -delete
	find $pkgdir -name "*.desktop" -exec sed -i -r "s!^Exec=.*!Exec=electron24 /opt/teams-for-linux/resources/app.asar!" {} \;
}
