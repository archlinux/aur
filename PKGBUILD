# Maintainer: FraV1982 <consulenza.vangi@libero.it>

pkgname=filezilla-server
pkgver=1.5.1
pkgrel=1
pkgdesc="A simple FTP, FTPS or SFTP server for ArchLinux."
arch=('x86_64')
url="https://filezilla-project.org/download.php?type=server"
license=('unknown')
depends=('vim')
optdepends=(
firefox
)

options=(!strip)

_debname=FileZilla_Server_1.5.1_x86_64-linux-gnu.deb

source=(https://dl3.cdn.filezilla-project.org/server/FileZilla_Server_1.5.1_x86_64-linux-gnu.deb)
sha256sums=('236066c83aea912eeebee3dd794c57389e6d0ee23a5bd8619dee387b88f89fc0')

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
