# Maintainer: Pablo Orduna <pabloorduna98@gmail.com>
# Contributor: Philippe Miron <tuxication@gmail.com>

pkgname=cryptocat
pkgver=3.2.08
pkgrel=1
pkgdesc="Free software with a simple mission: everyone should be able to chat with their friends in privacy"
arch=('x86_64')
url="https://crypto.cat"
license=('GPL3')
depends=('glib2' 'fuse2')
makedepends=('gendesk' 'gnupg')
options=('!strip')
source=("https://download.crypto.cat/client/Cryptocat-linux-x64.zip")
sha256sums=('3761847a2a4a96c8a706d67705af3d0fab230478dbea4ed652da84a773dfe880')

# In order to make the GPG verification work, import the following PGP key
# FA21CD536312FADF9B5DD804AB266CB76091B1F8  Nadim Kobeissi <nadim@nadim.computer>

prepare() {
  gpg --verify Cryptocat.AppImage.asc Cryptocat.AppImage
  gendesk -f -n --pkgname "$pkgname" --pkgdesc "$pkgdesc"
  bsdtar --to-stdout -xf Cryptocat.AppImage \
    usr/share/icons/default/64x64/apps/cryptocat.png > cryptocat.png
}

package() {
  install -d "$pkgdir"/usr/{bin,lib/cryptocat}
  install -Dm755 Cryptocat.AppImage "$pkgdir/usr/lib/cryptocat/Cryptocat.AppImage"
  install -Dm644 cryptocat.desktop "$pkgdir/usr/share/applications/cryptocat.desktop"
  install -Dm644 cryptocat.png "$pkgdir/usr/share/pixmaps/cryptocat.png"
  ln -s /usr/lib/cryptocat/Cryptocat.AppImage "$pkgdir/usr/bin/cryptocat"
}
