# Maintainer: robertfoster
pkgname=whatsie
pkgver=4.4
pkgrel=1
pkgdesc="A simple & beautiful desktop client for WhatsApp Web."
arch=('x86_64')
url="https://github.com/oberon-manjaro/$pkgname"
license=('MIT')
depends=('desktop-file-utils'
         'gconf'
         'gtk2'
         'gvfs'
         'hicolor-icon-theme'
         'libcap'
         'libgcrypt'
         'libgudev'
         'libnotify'
         'libxss'
         'libxtst'
         'nss'
         'python'
         'xdg-utils')
optdepends=('hunspell: spell check' )
options=('!docs' '!emptydirs')
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver-linux-amd64.deb")
md5sums=('d2e5cb515503cb9e4ae2f574992772c0')
package() {
  msg2 "Extracting the data.tar.gz..."
  bsdtar -xf data.tar.gz -C "$pkgdir/"

  # Link to the binary
  msg2 "Creating symlink..."
  mkdir -p "$pkgdir/usr/bin/"
  ln -s /opt/$pkgname/$pkgname "$pkgdir/usr/bin/$pkgname"

  # Archify folder permissions
  cd $pkgdir
  for d in $(find . -type d); do
    chmod 755 $d
  done
}
