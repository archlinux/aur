# Maintainer: Julian Pollinger <julian@pollinger.dev>
# Contributor: Aaron Liu <aaronliu0130@Gm A il. C om>
_pkgname=muse-sounds-manager
pkgname="$_pkgname-bin"
pkgver=2.2.1.953
pkgrel=1
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
b2sums=('a9f0976eba9da07445bc3c301ec9645f08703f72af0589a43c9d01d27830f3f07f14b40850e928adce04159dd7338c3d31eec6f3f24f97e38014a7ac23e1b028'
        'cfd9010e282a9fcab9b7366257ea2a7fffb6cfef8f1f7815d28923b79f491ec98bdee1b67284ced9e406e2f86a781136970e360e62ab71c7f4c99c777eeb7f8a')

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
