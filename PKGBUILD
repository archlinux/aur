# Contributor: AlphaJack <alphajack at tuta dot io>
# Contributor: Asuka Minato

pkgname="teams-for-linux-electron-bin"
pkgver=1.3.13
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
sha256sums_x86_64=('4362000113929feaf37797754fcb2fc754255cdccc49a560c8c29e0bc0ca5def')
sha256sums_aarch64=('e9184f6c01230e33a52d542d3512fbf96d3f4aadeef5f5542667cfd1c7ecbba0')
sha256sums_armv7h=('6d12be1d9a52aa10e1d26a52d1a4144799234c2494597a9e9babeb469e89c3c7')
options=("!strip")

package() {
	tar -xf "data.tar.xz" -C $pkgdir
	find "$pkgdir"/opt -type f -not -path "*resources/*" -delete
	find $pkgdir -name "*.desktop" -exec sed -i -r "s!^Exec=.*!Exec=electron24 /opt/teams-for-linux/resources/app.asar!" {} \;
}
