# Contributor: AlphaJack <alphajack at tuta dot io>
# Contributor: Asuka Minato

pkgname="teams-for-linux-electron-bin"
pkgver=1.3.5
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
sha256sums_x86_64=('d6e258b79fcfbad6498f27342778664e91c9c933d67d06dfba9f79e5e8b6f264')
sha256sums_aarch64=('63e5ff3602960b57bfcadb5c05981ae85d0e49307132c95b2973a7637ac60298')
sha256sums_armv7h=('22fa61428ead0555cb2995d4b87113bb7cf8ef029aae68c2d7f9033d48f84280')
options=("!strip")

package() {
	tar -xf "data.tar.xz" -C $pkgdir
	find "$pkgdir"/opt -type f -not -path "*resources/*" -delete
	find $pkgdir -name "*.desktop" -exec sed -i -r "s!^Exec=.*!Exec=electron24 /opt/teams-for-linux/resources/app.asar!" {} \;
}
