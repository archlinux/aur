# Maintainer: William Brown <glowinthedarkcia@horsefucker.org>
pkgname="thrive-launcher-bin"
pkgver="1.2.3"
pkgrel="2"
arch=("x86_64")
pkgdesc="Manages downloading Thrive releases."
url="https://github.com/Revolutionary-Games/Thrive-Launcher#readme"
source=("https://github.com/Revolutionary-Games/Thrive-Launcher/releases/download/v$pkgver/thrive-launcher_${pkgver}_amd64.deb")
noextract=("thrive-launcher_${pkgver}_amd64.deb") # Extract manually in prepare()
md5sums=("ab64162afcb51cd3f75e79c594a2b43d")
license=("GPL" "MIT")
depends=("gtk3" "nss" "libxss" "libxtst" "at-spi2-core" "lib32-glibc" "libutil-linux" "libsecret")
install="$pkgname.install"
prepare() {
	cd "$srcdir"
	ar -xf "thrive-launcher_${pkgver}_amd64.deb"
	rm debian-binary control.tar.gz
	bsdtar -xzf data.tar.xz
	rm data.tar.xz
}
package() {
	cp -R "$srcdir/opt" "$pkgdir"
	cp -R "$srcdir/usr" "$pkgdir"
}
