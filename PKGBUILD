# Maintainer: Matt Quintanilla <matt @ matt quintanilla .xyz>
# Maintainer: claymorwan <claymorwan@fembois.dev>

_pkgname="shijima-qt"

pkgname='shijima-qt-bin'
pkgver='0.0.3'
pkgrel='2'
pkgdesc='Cross-platform shimeji simulation Desktop pets on any device.'
arch=('x86_64')
url='https://github.com/pixelomer/Shijima-Qt'
license=('GPL-3.0-only')
depends=(
  'qt6-base'
  'fuse2'
  'fuse-common'
  'qt6-multimedia'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
options=(!strip)
source=(
  "$_pkgname.zip::$url/releases/download/v$pkgver/release-linux-x86_64.zip"
  "$_pkgname-icon.png::$url/blob/main/shijima.png"
  "LICENSE::$url/blob/main/LICENSE"
)
sha256sums=('fdc0013696be6c1d30ce525461f48be8ae72553fca094b596d75edd8b6051f43'
            '71acb148b54169ca2539730efee902d0827ec3d231b669d7cf46e67be54093d4'
            'ceb182b4dd99090be4eb53dc77bc28e84cfa3385b377bc9add7a6606ce8cea24')

package() {
  install -D "$_pkgname-icon.png" "$pkgdir/usr/share/icons/$_pkgname.png"
  cd "$srcdir"
  install -d "$pkgdir/usr/bin/"
  install -d "$pkgdir/opt/$_pkgname"

  install -Dm755 "Shijima-Qt-x86_64.AppImage" "$pkgdir/opt/$_pkgname/Shijima-Qt-x86_64.AppImage"

  ln -s "/opt/$_pkgname/Shijima-Qt-x86_64.AppImage" "$pkgdir/usr/bin/$_pkgname"

  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -Dm0644 /dev/stdin $pkgdir/usr/share/applications/$_pkgname.desktop << EOF
[Desktop Entry]
Name=Shijima-Qt
Exec=$_pkgname
Icon=$_pkgname
Terminal=false
Type=Application
Comment=meow
Categories=Game
EOF
}
