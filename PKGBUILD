# Ian Lester <aur.lester.snowy907-AT-silomails.com>
pkgname=sphereview-git
pkgver=v0.1.6.r0.gfe0428b
pkgrel=1
pkgdesc="Image viewer for 360° equirectangular photospheres and panoramas"
arch=("x86_64")
url="https://github.com/dynobo/sphereview"
license=('MIT')
groups=()
depends=('gtk4' 'libadwaita' 'glib2' 'webkitgtk-6.0')
makedepends=('git' 'blueprint-compiler' 'rust' 'npm')
provides=("${pkgname%-VCS}")
conflicts=("${pkgname%-VCS}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/dynobo/sphereview')
noextract=()
sha256sums=('SKIP')


pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${pkgname%-git}/resources/photosphereviewer"
	npm install
	cd ../..
	cargo build --release
}

package() {
	install -Dm755 "${pkgname%-git}/target/release/sphereview" "${pkgdir}/usr/bin/sphereview"
	install -Dm644 "${pkgname%-git}/io.github.dynobo.sphereview.desktop" "${pkgdir}/usr/share/applications/io.github.dynobo.sphereview.desktop"
    install -Dm644 "${pkgname%-git}/LICENSE" "$pkgdir/usr/share/licenses/sphereview-git/LICENSE"
    install -Dm644 "${pkgname%-git}/README.md" "$pkgdir/usr/share/doc/sphereview-git/README.md"
}

