# Maintainer: archcrack <johndoe.arch@outlook.com>

pkgname=clifm
pkgver=0.29.2
pkgrel=1
pkgdesc="The KISS file manager: cli-based, ultra-lightweight, and lightning fast"
arch=(any)
url="https://github.com/leo-arch/clifm"
license=(GPL2)
depends=('libcap' 'acl' 'readline' 'file')
optdepends=(
	'sshfs: SFTP support'
	'cifs-utils: Samba support'
	'curlftpfs: FTPFS support'
	'archivemount: Archives mount'
	'atool: Archives/compression support'
	'p7zip: ISO 9660 support'
	'cdrtools: ISO 9660 support'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/leo-arch/$pkgname/archive/v${pkgver}.tar.gz")
sha256sums=('49e84f88e2de435a7cef25daea684718a6ece1ed5c67fc10879212fc53270da8')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  gcc -O3 -march=native -s -fstack-protector-strong -o "$pkgname" "${pkgname}.c" -lreadline -lacl -lcap
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -g 0 -o 0 -Dm644 manpage "$pkgdir/usr/share/man/man1/${pkgname}.1"
  gzip "${pkgdir}/usr/share/man/man1/${pkgname}.1"
  install -g 0 -o 0 -Dm644 "${pkgname}.desktop" "$pkgdir/usr/share/applications/${_pkgname}.desktop"
  install -g 0 -o 0 -Dm644 "translations/spanish/${pkgname}.mo" "$pkgdir/usr/share/locale/es/LC_MESSAGES/${pkgname}.mo"
}
