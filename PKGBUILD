# Maintainer: pokemonpasta
_pkgname=linuxhammerlauncher
pkgname=$_pkgname-bin
pkgdesc="A launcher, installer and updater for Hammer++ & Tools++ (VBSP++, VVIS++, VRAD++) on Linux, for many different Source Engine games."
pkgver=1.0.3
pkgrel=1

arch=(x86_64)
url="https://github.com/EnderCatCore/linuxhammerlauncher"
license=("GPL-3.0-only")
depends=(
	wine
	winetricks
	zstd
	python
)
options=(!strip !debug)

source=(
	"$pkgname-$pkgver.zip::https://github.com/EnderCatCore/linuxhammerlauncher/releases/download/$pkgver/Linux.Hammer.Launcher.zip"
	"$_pkgname.desktop"
)
sha256sums=('e7b873e4951bc477ba55af0caef61980f1a1e58009809eaa2a81969d1dbf7653'
            'b4f6fdcd177a6044ac2efe97f66303c2bce43f26dec3cd1096363e9d3f219824')

package() {
	cd "$srcdir/Linux Hammer Launcher"
	
	install -Dm755 "Linux Hammer Launcher" "$pkgdir/usr/lib/$pkgname/Linux Hammer Launcher"
	cp -r "_internal" "$pkgdir/usr/lib/$pkgname"
	
	install -dm755 "$pkgdir/usr/bin"
	ln -s "/usr/lib/$pkgname/Linux Hammer Launcher" "$pkgdir/usr/bin/$_pkgname"
	
	install -Dm644 "../$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
	install -Dm644 "_internal/assets/icon.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/$_pkgname.png"
}
