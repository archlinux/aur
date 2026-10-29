# Maintainer: Tashila Pathum <tashila.pathum@gmail.com>
#
# Packages the release tarball. Updated per release with scripts/aur-release.sh in the upstream repo.
pkgname=backupthing-bin
_name=backupthing
pkgver=0.2.1
pkgrel=1
pkgdesc="Compress phone photos and videos to AVIF/AV1 and back them up to Proton Drive"
arch=('any')
url="https://github.com/tashilapathum/backupthing"
license=('GPL-3.0-or-later')
depends=('java-runtime>=21' 'ffmpeg' 'libavif' 'proton-drive-cli-bin')
optdepends=('waybar: status bar module (snippet in /usr/share/backupthing/waybar)')
provides=("$_name")
conflicts=("$_name")
source=("$url/releases/download/v$pkgver/$_name-$pkgver.tar.gz")
sha256sums=('8cc9fd834fd21a50d47d7d3db1170844489f75a5b9fa9a26231059b9ec721889')

package() {
  cd "$_name-$pkgver"
  install -d "$pkgdir/usr/share/$_name"
  cp -r bin lib "$pkgdir/usr/share/$_name/"
  rm -f "$pkgdir/usr/share/$_name/bin/$_name.bat"
  install -d "$pkgdir/usr/bin"
  ln -s "/usr/share/$_name/bin/$_name" "$pkgdir/usr/bin/$_name"

  install -Dm644 share/systemd/user/$_name.service "$pkgdir/usr/lib/systemd/user/$_name.service"
  install -Dm644 -t "$pkgdir/usr/share/$_name/waybar" share/waybar/*
  install -Dm644 share/applications/$_name.desktop "$pkgdir/usr/share/applications/$_name.desktop"
  install -Dm644 share/icons/hicolor/scalable/apps/$_name.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_name.svg"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE THIRD_PARTY_NOTICES
  install -Dm644 -t "$pkgdir/usr/share/doc/$_name" README.md CHANGELOG.md
}
