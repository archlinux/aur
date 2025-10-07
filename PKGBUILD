# Maintainer: Chase Leinart <chase leinart at proton dot me>
# Contributor: Itamar Shabtai <itamar.shabtai.1@gmail.com>

pkgname="artix-games-launcher"
pkgver="2.20"
pkgrel=1
pkgdesc="One app. All your favorite Artix games."
arch=("x86_64")
url="https://www.artix.com/downloads/artixlauncher/"
license=('LicenseRef-Proprietary')
depends=('fuse2')
options=('!strip')
source=("https://launch.artix.com/latest/Artix_Games_Launcher-x86_64.AppImage"
        "LICENSE.html::https://www.artix.com/policy-terms")
sha512sums=('35cbe8230f2abaaaa99b5f1861744d469bfe1f28a2d906b8aaed6c8553c2fc282a11fe42cf6ab10d09650dad7c7b988fdf758ef88c2db082fa07e60d936ab683'
            'SKIP') # Website changes affect the license page's hash'8972f49d2087860853439c7161fcd45744183cc5d26b3b18f080d654888fff117ebca10ac161b6d258d29bb20260a6ad89dd7086652e2ee9c72356f40bc9503a')

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
