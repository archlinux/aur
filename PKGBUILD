# Maintainer: steamport <steamport@protonmail.com>
pkgname=tgstation-server-controlpanel-git
pkgver=r221.e0f1033
pkgrel=1
pkgdesc="Official client for tgstation-server v4"
arch=("x86_64")
url="https://github.com/tgstation/Tgstation.Server.ControlPanel"
license=('GPL')
groups=()
depends=('fontconfig')
makedepends=('git' 'dotnet-sdk')
provides=("${pkgname%-VCS}")
conflicts=("${pkgname%-VCS}")
replaces=()
backup=()
options=()
install=
source=('tgstation-server-controlpanel::git+https://github.com/tgstation/Tgstation.Server.ControlPanel'
'tgstation-server-controlpanel.desktop')
noextract=()
sha512sums=('SKIP'
'a7bb6c5c348526798cc0fc244c79a075016018791dccb63cc2320daa2e1bbfb1cb6ad58a8039ee8f5457e8f415af556ad8235868be9d53055fe30c27a8d98c92'
)


pkgver() {
	cd "$srcdir/tgstation-server-controlpanel"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	rm -rf "$srcdir/build_out"
	mkdir "$srcdir/build_out"
	cd "$srcdir/tgstation-server-controlpanel/src/Tgstation.Server.ControlPanel.Core"
	dotnet publish -c Release -o "$srcdir/build_out"
}

package() {
	mkdir -p "$pkgdir/opt"
	cp -R "$srcdir/build_out" "$pkgdir/opt/tgscp/"
	install -Dm644 "$srcdir/tgstation-server-controlpanel.desktop" "$pkgdir/usr/share/applications/tgstation-server-controlpanel.desktop"
}
