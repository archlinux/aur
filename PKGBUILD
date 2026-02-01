# Maintainer: Julian Pollinger <julian@pollinger.dev>
_pkgname=muse-sounds-manager
pkgname="$_pkgname-bin"
pkgver=2.1.1.912
pkgrel=2
pkgdesc="Manage MuseScore Libraries"
arch=('x86_64')
url='https://www.musehub.com/'
license=(custom:muse-sounds-manager)  # TODO: probably needs update?
replaces=('muse-hub')
conflicts=('muse-hub')
depends=('fontconfig' 'zlib' 'hicolor-icon-theme')
makedepends=()
install="$_pkgname.install"
source=("$pkgname-$pkgver.tar.gz::https://muse-cdn.com/Muse_Sounds_Manager_x64.tar.gz" 'LICENSE')
sha256sums=('7e376eac0a8e6a2c3ca94626ee83bcb711c22abac64afbe7980c4b53ce08812c'
            'ed3c749e7391b70b11717469815ce8fe65a962cf40dd4df88e21bf240b2058b2')

package(){
  # Extract package data
  #tar -xJ -f data.tar.xz -C "$pkgdir"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/muse-sounds-manager"

  cd $srcdir/Muse_Sounds_Manager_x64_$pkgver

  # mkdir -p "$pkgdir/usr/lib/muse-sounds-manager"
  mkdir -p "$pkgdir/opt/muse-sounds-manager"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/applications"
  mkdir -p "$pkgdir/usr/share/icons"

  cp bin/* "$pkgdir/opt/muse-sounds-manager/"
  # rm "$pkgdir/opt/muse-sounds-manager/libSkiaSharp.so"
  # ln -s /usr/lib/libSkiaSharp.so "$pkgdir/opt/muse-sounds-manager/libSkiaSharp.so"

  ln -s /opt/muse-sounds-manager/muse-sounds-manager "$pkgdir/usr/bin/muse-sounds-manager"

  cp res/muse-sounds-manager.desktop "$pkgdir/usr/share/applications/muse-sounds-manager.desktop"

  cp -r res/icons/* "$pkgdir/usr/share/icons"
}

pkgver() {
  folder_name=$(ls | grep -E '^Muse_Sounds_Manager_x64_[0-9]+(\.[0-9]+)+$')
  version=$(echo "$folder_name" | grep -oP '\d+(\.\d+)+$')
  echo "$version"
}
