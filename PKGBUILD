# Maintainer: Matt Quintanilla <matt @ matt quintanilla .xyz>
# Maintainer: claymorwan <claymorwan@fembois.dev>

_pkgname="shijima-qt"

pkgname='shijima-qt-bin'
pkgver='0.1.0'
pkgrel='1'
pkgdesc='Cross-platform shimeji simulation Desktop pets on any device.'
arch=('x86_64')
url='https://github.com/pixelomer/Shijima-Qt'
license=('GPL-3.0-only')
depends=(
  'qt6-base'
  'qt6-multimedia'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
options=("!strip" "!debug")
source=(
  "$_pkgname.zip::$url/releases/download/v$pkgver/release-linux-x86_64.zip"
  "$_pkgname-icon.png::https://raw.githubusercontent.com/pixelomer/Shijima-Qt/refs/heads/main/com.pixelomer.ShijimaQt.png"
  "LICENSE::$url/blob/main/LICENSE"
)
sha256sums=('0f9f5ecb0f35c53236c8568421d541b964c9a75c9abd6500bff44edd9580b08c'
            '71acb148b54169ca2539730efee902d0827ec3d231b669d7cf46e67be54093d4'
            '3df63026412f70001074b7c7cfd371fe42bbe43ba23673e8111ffe072b426d4a')

package() {
  cd "$srcdir"
  install -d "$pkgdir/usr/bin/"
  install -d "$pkgdir/opt/$_pkgname"

  install -Dm755 "Shijima-Qt-x86_64.AppImage" "$pkgdir/opt/$_pkgname/Shijima-Qt-x86_64.AppImage"
  install -Dm755 "$_pkgname" "$pkgdir/opt/$_pkgname/$_pkgname"
  install -Dm755 "libunarr.so.1" "$pkgdir/opt/$_pkgname/libunarr.so.1"

  ln -s "/opt/$_pkgname/Shijima-Qt-x86_64.AppImage" "$pkgdir/usr/bin/$_pkgname"
  
  # Icon
  install -D "$_pkgname-icon.png" "$pkgdir/usr/share/icons/$_pkgname.png"

  # Licences
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  cd licenses
	for _file in *; do
		if [ -f "$_file" ]; then
			install -Dm644 $_file "$pkgdir/usr/share/licenses/$_pkgname/$_file"
		fi
	done


  install -Dm0644 /dev/stdin $pkgdir/usr/share/applications/$_pkgname.desktop << EOF
[Desktop Entry]
Name=Shijima-Qt
Exec=$_pkgname
Icon=$_pkgname
Terminal=false
Type=Application
Comment=Cross-platform shimeji simulation for desktop
EOF
}
