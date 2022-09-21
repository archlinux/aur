# Maintainer: FraV1982 <consulenza.vangi@libero.it>

pkgname=filezilla-server
pkgver=1.5.1
pkgrel=1
pkgdesc="A simple FTP, FTPS or SFTP server for ArchLinux."
arch=('x86_64')
url="https://filezilla-project.org/download.php?type=server"
license=('unknown')
depends=('software-properties-common')
optdepends=(
)
options=(!strip)

_debname=FileZilla_Server_1.5.1_x86_64-linux-gnu.deb

source=(https://dl3.cdn.filezilla-project.org/server/FileZilla_Server_1.5.1_x86_64-linux-gnu.deb)
sha512sums=('a8a6a3b39bbe5c12335bab01ce1283771dc2398ae5ed863a2bfb8c8110419065b95088e988299aa4d162663464bb6c9b999f7b5e9fba19a3dd465e50b9f4c581')

prepare() {
  cd "$srcdir"
  msg2 "Decompressing Debian package..."
  ar xv "${_debname}" > /dev/null
  tar -xf data.tar.xz > /dev/null

  #find ./{etc,usr} -type d -exec chmod 755 '{}' \;
  find ./usr -type d -exec chmod 755 '{}' \;
  chmod 755 ./usr/local/bin/filezilla/filezilla-server
}

package() {
  cd "$srcdir"
  #cp -dpr --no-preserve=ownership {opt,usr} "$pkgdir"
  cp -dpr --no-preserve=ownership ./usr "$pkgdir"
}
