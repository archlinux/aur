# Maintainer: Julian Pollinger <julian@pollinger.dev>
_pkgname=muse-sounds-manager
pkgname="$_pkgname-bin"
pkgver=2.0.4.872
pkgrel=1
pkgdesc="Manage MuseScore Libraries"
arch=('x86_64')
url='https://www.musehub.com/'
license=(custom:muse-sounds-manager)
provides=("$_pkgname=$pkgver")
replaces=('muse-hub')
conflicts=('muse-hub')
depends=('fontconfig' 'zlib' 'hicolor-icon-theme' 'skia-sharp')
makedepends=()
install="$_pkgname.install"
source=("_$pkgname-$pkgver.tar.gz::https://muse-cdn.com/Muse_Sounds_Manager_x64.tar.gz" 'LICENSE')
sha256sums=('55c2c15e92c393dd327748fd348cc13975c072248b58ff72e57e752f6ffd5b80'
            'ed3c749e7391b70b11717469815ce8fe65a962cf40dd4df88e21bf240b2058b2')
options=('!strip')

package(){
  # Extract package data
  #tar -xJ -f data.tar.xz -C "$pkgdir"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/muse-sounds-manager"

  cd $srcdir/muse_sounds_manager_x64_$pkgver

  # mkdir -p "$pkgdir/usr/lib/muse-sounds-manager"
  mkdir -p "$pkgdir/opt/muse-sounds-manager"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/applications"
  mkdir -p "$pkgdir/usr/share/icons"

  cp bin/* "$pkgdir/opt/muse-sounds-manager/"
  rm "$pkgdir/opt/muse-sounds-manager/libSkiaSharp.so"

  ln -s /opt/muse-sounds-manager/muse-sounds-manager "$pkgdir/usr/bin/muse-sounds-manager"

  cp res/muse-sounds-manager.desktop "$pkgdir/usr/share/applications/muse-sounds-manager.desktop"

  cp -r res/icons/* "$pkgdir/usr/share/icons"
}

pkgver() {
  folder_name=$(ls | grep -E '^muse_sounds_manager_x64_[0-9]+(\.[0-9]+)+$')
  version=$(echo "$folder_name" | grep -oP '\d+(\.\d+)+$')
  echo "$version"
}
