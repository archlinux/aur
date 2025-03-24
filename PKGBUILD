# Maintainer: Diab Neiroukh <public at thezest dot dev>

pkgname="wsl-hello-sudo-bin"
pkgver="3.0.0"
pkgrel=1
arch=("x86_64")
pkgdesc="Linux PAM module to utilise Windows Hello authentication on WSL"
url="https://github.com/lzlrd/wsl-hello-sudo"
license=("MIT")
depends=(
	"bash"
	"pam"
)
provides=("wsl-hello-sudo")
source=("https://github.com/lzlrd/wsl-hello-sudo/releases/download/v$pkgver/release.tar.gz")
b2sums=("554fdd193db62a76715e82c66869c97c6170e199cc3d0248abfac75c35de310769467055f1c257db7b856fde194de80159139a71e1abcfd46effd40ddaf6b541")

package() {
	cd "release"
	install -D -m755 "install.sh" "$pkgdir/opt/${pkgname//-bin/}/install.sh"
	install -D -m644 "pam-config" "$pkgdir/opt/${pkgname//-bin/}/pam-config"
	cd "build"
	install -D -m644 "pam_wsl_hello.so" "$pkgdir/opt/${pkgname//-bin/}/build/pam_wsl_hello.so"
	install -D -m755 "WindowsHelloBridge.exe" "$pkgdir/opt/${pkgname//-bin/}/build/WindowsHelloBridge.exe"
}
