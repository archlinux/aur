# Maintainer: Eliacim <aur@aldo.pw>
pkgname=artix-games-launcher-appimage
pkgver=2.1.2
pkgrel=1
pkgdesc="Artix Games Launcher AppImage"
arch=('x86_64')
url="https://www.artix.com/downloads/artixlauncher"
license=('unknown')
source=("https://launch.artix.com/latest/Artix_Games_Launcher-x86_64.AppImage")
noextract=('Artix_Games_Launcher-x86_64.AppImage')
sha256sums=('53da3c186761f1367f6c915c5063a14172219cd75df6bb2848fef55d73ce4561')

prepare() {
    chmod +x Artix_Games_Launcher-x86_64.AppImage
    ./Artix_Games_Launcher-x86_64.AppImage --appimage-extract
}

build() {
	sed -i '/^Name=/a Comment=One app. All your favorite Artix games.' ${srcdir}/squashfs-root/ArtixGamesLauncher.desktop
    sed -i '4s@^Exec=.*@Exec=/opt/artix-games-launcher/Artix_Games_Launcher.AppImage %u@' ${srcdir}/squashfs-root/ArtixGamesLauncher.desktop
	sed -i '5s@^Icon=.*@Icon=/usr/share/pixmaps/ArtixLogo.png@' ${srcdir}/squashfs-root/ArtixGamesLauncher.desktop
}


package() {
    install -Dm755 ${srcdir}/Artix_Games_Launcher-x86_64.AppImage ${pkgdir}/opt/artix-games-launcher/Artix_Games_Launcher.AppImage
	install -Dm644 ${srcdir}/squashfs-root/ArtixLogo.png ${pkgdir}/usr/share/pixmaps/ArtixLogo.png
    install -Dm755 ${srcdir}/squashfs-root/ArtixGamesLauncher.desktop ${pkgdir}/usr/share/applications/ArtixGamesLauncher.desktop
}
