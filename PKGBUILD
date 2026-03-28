# Maintainer: aus <austin@theaus.xyz>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Swift Geek
# Contributor: c0nd0r <gcesarmza@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: webjdm <web.jdm@gmail.com>
# Contributor: magedon <magedon.zt@gmail.com>
# Contributor: Ali Akbar

pkgname=bin32-filezilla-bin
pkgver=3.69.6
pkgrel=1
pkgdesc="Fast and reliable FTP, FTPS and SFTP client - 32bit version for 64bit systems"
arch=('x86_64')
_arch=i686
license=('MPL' 'GPL' 'LGPL')
provides=('bin32-filezilla')
conflicts=('bin32-filezilla')
url="https://filezilla-project.org/"
depends=('bash' 'lib32-cairo' 'lib32-fontconfig' 'lib32-freetype2'
	 'lib32-gdk-pixbuf2' 'lib32-glib2' 'lib32-glibc' 'lib32-gtk3' 'lib32-libx11' 'lib32-libxcb'
	'lib32-libxcomposite' 'lib32-libxcursor' 'lib32-libxdamage' 'lib32-libxext' 'lib32-libxfixes' 'lib32-libxi'
	'lib32-libxrandr' 'lib32-libxrender' 'lib32-nspr' 'lib32-nss' 'lib32-pango')
optdepends=()
source=(https://dl2.cdn.filezilla-project.org/client/FileZilla_${pkgver}_$_arch-linux-gnu.tar.xz
        'filezilla32.desktop')
sha256sums=('35be448c852d19c22295ffc6b3940662d30d513b74a40459886062eb52767929'
            'd69a541de35f27a7f771b3c4fe10bb81f5be548a2e8399b6136566a22f1391fc')
validpgpkeys=() # Mozilla Software Releases <release@mozilla.com>

package() {
  # directory and files
  cd ${pkgdir}
  mkdir -p {usr/bin,usr/lib32}

  cp -r ${srcdir}/FileZilla3 usr/lib32
  cat <<EOF > usr/bin/filezilla32
#!/bin/bash
/usr/lib32/FileZilla3/bin/filezilla \$*
EOF
  chmod +x usr/bin/filezilla32

  # desktop icons
  cd ${srcdir}
  install -d ${pkgdir}/usr/share/applications
  install -Dm644 filezilla32.desktop ${pkgdir}/usr/share/applications
}
