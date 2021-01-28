# Maintainer: archcrack <johndoe.arch@outlook.com>

pkgname=clifm
pkgver=0.27.1
pkgrel=2
pkgdesc="The KISS file manager: cli-based, ultra-lightweight, and lightning fast"
arch=(any)
url="https://github.com/leo-arch/clifm"
license=(GPL2)
depends=('ncurses' 'libcap' 'file')
makedepends=('git')
optdepends=('sshfs: SFTP support' 'cifs-utils: Samba support' 'curlftpfs: FTPFS support' 'archivemount: Archives mount' 'atool: Archives/compression support')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/leo-arch/$pkgname/archive/v${pkgver}.tar.gz")
sha256sums=('5abff035020f4d47c812568452ef550c54107b0f907003dde3b0decab8fc46c8')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  gcc -O3 -march=native -s -fstack-protector-strong -o "$pkgname" "${pkgname}.c" -lreadline -lacl -lcap
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -g 0 -o 0 -Dm644 manpage "$pkgdir/usr/share/man/man1/${pkgname}.1"
  gzip "${pkgdir}/usr/share/man/man1/${pkgname}.1"
  install -g 0 -o 0 -Dm644 "translations/spanish/${pkgname}.mo" "$pkgdir/usr/share/locale/es/LC_MESSAGES/${pkgname}.mo"
}
