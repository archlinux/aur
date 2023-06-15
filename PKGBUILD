# Maintainer: Itamar Shabtai <itamar.shabtai.1@gmail.com>

pkgname="artix-games-launcher"
pkgver="2.1.2"
pkgrel=1
pkgdesc="One app. All your favorite Artix games."
arch=("x86_64")
url="https://www.artix.com/downloads/artixlauncher/"
license=('custom')
depends=('fuse2')
options=('!strip')
source=("https://launch.artix.com/latest/Artix_Games_Launcher-x86_64.AppImage"
        "LICENSE.html::https://www.artix.com/policy-terms")
sha512sums=('22f89a4cb0d6447f9e6ae46c1929a3e623ef589137fdf71d47d160d41ee9a24ecc0a91bfabc9ab50fcbf3915baa642d706018ab9dd136bdf7d5cfdf7ab5f5536'
            'SKIP') # Website changes affect the license page's hash

prepare() {
	chmod +x "$srcdir"/Artix_Games_Launcher-x86_64.AppImage
	"$srcdir"/Artix_Games_Launcher-x86_64.AppImage --appimage-extract
}

package() {
	install -Dm644 "$srcdir"/LICENSE.html "$pkgdir"/opt/"$pkgname"/LICENSE.html
	install -Dm644 "$srcdir"/squashfs-root/ArtixLogo.png "$pkgdir"/opt/"$pkgname"/icon.png
	install -Dm644 "$srcdir"/squashfs-root/ArtixGamesLauncher.desktop "$pkgdir"/opt/"$pkgname"/artix-games-launcher.desktop
	install -Dm755 "$srcdir"/Artix_Games_Launcher-x86_64.AppImage "$pkgdir"/opt/"$pkgname"/Artix_Games_Launcher-x86_64.AppImage
	
	install -d "$pkgdir"/usr/{bin,share/{pixmaps,applications,licenses/"$pkgname"}}
	ln -s /opt/"$pkgname"/LICENSE.html "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE.html
	ln -s /opt/"$pkgname"/icon.png "$pkgdir"/usr/share/pixmaps/ArtixLogo.png
	ln -s /opt/"$pkgname"/artix-games-launcher.desktop "$pkgdir"/usr/share/applications/artix-games-launcher.desktop
	ln -s /opt/"$pkgname"/Artix_Games_Launcher-x86_64.AppImage "$pkgdir"/usr/bin/ArtixGameLauncher
}
