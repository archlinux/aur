# Maintainer: TheElevatedOne <adam.mlady@elevated.ovh>

pkgname=beluga-bin
_pkgname=beluga
pkgver=1.4.0
pkgrel=1
pkgdesc='File manager written with plain GTK 4, a rewrite of KDE Dolphin without Qt or KDE Frameworks (prebuilt)'
arch=('x86_64')
url='https://github.com/TheElevatedOne/beluga'
license=('GPL-2.0-or-later')
depends=('gcc-libs' 'glibc' 'glib2' 'gtk4' 'gdk-pixbuf2' 'pango' 'cairo' 'libarchive' 'ffmpeg')
optdepends=('udisks2: drives and partitions in the Places panel'
            'tumbler: previews of videos and documents'
            'gvfs: network locations such as sftp:// and smb://'
            'xdg-desktop-portal: Beluga as the file chooser of other programs'
            'polkit: View › Act as Administrator (with a polkit agent)')
provides=("beluga=$pkgver")
conflicts=('beluga')
# The release binary is built on Arch Linux by the GitHub workflow and already stripped.
options=('!debug' '!strip')
# Release tags have no "v" prefix. Run updpkgsums after the release is published.
source_x86_64=("$url/releases/download/$pkgver/$_pkgname-$pkgver-linux-x86_64.tar.gz")
sha256sums_x86_64=('b6faa554dd12b588b33fe90a1a4d6e5428ad78d7c268307d14520dcccf0a1372')

package() {
  cd "$_pkgname-$pkgver-linux-$CARCH"
  install -Dm755 bin/beluga -t "$pkgdir/usr/bin"
  find share -type f -exec install -Dm644 {} "$pkgdir/usr/{}" \;
  install -Dm644 README.md CHANGELOG.md -t "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname"
}
