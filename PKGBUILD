# Maintainer: brionical27 <brionical@proton.me>
pkgname=css-loader-desktop-bin
pkgver=1.2.1
pkgrel=5
epoch=
pkgdesc="The official desktop app for CSSLoader (Decky Loader Required)"
arch=(x86_64)
url="https://github.com/DeckThemes/CSSLoader-Desktop"
license=('GPL')
groups=()
depends=("fuse2" "openssl-1.1" "gtk3" "libglvnd" "cairo" "graphite" "libcloudproviders" "dbus" "brotli" "libwebp" "libxrandr" "libxcursor" "webkit2gtk")
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$url/releases/download/v$pkgver/CSSLoader.Desktop_$pkgver.AppImage")
noextract=()
sha256sums=(SKIP)
validpgpkeys=()

# prepare() {}

# build() {}

# check() {}

package() {
   mv CSSLoader.Desktop_$pkgver.AppImage cssloader-desktop.AppImage
   chmod +x cssloader-desktop.AppImage
   ./cssloader-desktop.AppImage --appimage-extract
   cd $srcdir/squashfs-root
   mkdir -p $pkgdir/usr/share/applications
   cp -r usr/bin $pkgdir/usr/bin
   chmod +x $pkgdir/usr/bin/css-loader-desktop
   rm -rf $pkgdir/usr/share/glib-2.0/schemas
   cp $srcdir/cssloader-desktop.AppImage $pkgdir/usr/bin

echo "[Desktop Entry]
	Name=CSSLoader Desktop
	GenericName=The official desktop app for CSSLoader
	Exec=css-loader-desktop
	Terminal=false
	Type=Application
	Icon=css-loader-desktop;
	Categories=Utility;Game" >>"$pkgdir/usr/share/applications/css-loader-desktop.desktop"
   cp -r $srcdir/squashfs-root/usr/share/icons/ $pkgdir/usr/share/

}
