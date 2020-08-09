# Maintainer: William Brown <glowinthedarkcia@horsefucker.org>
pkgname="thrive-launcher-bin"
pkgver="1.2.4"
pkgrel="1"
arch=("x86_64")
pkgdesc="Manages downloading Thrive releases."
url="https://github.com/Revolutionary-Games/Thrive-Launcher#readme"
source=("https://github.com/Revolutionary-Games/Thrive-Launcher/releases/download/v$pkgver/thrive-launcher_${pkgver}_amd64.deb" "https://raw.githubusercontent.com/Revolutionary-Games/Thrive-Launcher/master/LICENSE.md")
noextract=("thrive-launcher_${pkgver}_amd64.deb") # Extract manually in prepare()
md5sums=("6a02268a2ccb6451d8a6ba665989020a" "1e8eef1b89f69a4f93ca6d1d6b9088df")
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
	mkdir -p "$srcdir/usr/share/licenses/thrive-launcher-bin"
	cp LICENSE.md "$srcdir/usr/share/licenses/thrive-launcher-bin/LICENSE"
	cp -R "$srcdir/opt" "$pkgdir"
	cp -R "$srcdir/usr" "$pkgdir"
}
