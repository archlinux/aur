# Maintainer: archcrack <johndoe.arch@outlook.com>

pkgname=clifm
pkgver=1.1
pkgrel=1
pkgdesc="The KISS, non-curses terminal file manager"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'aarch64' 'armv7h')
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
sha256sums=('e2be66e8000fc43f177e472045d9d30f44625e854d85b4cdf5aad8179d32d5af')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  gcc -O3 -s -fstack-protector-strong -Wall -o "$pkgname" *.c -lreadline -lacl -lcap
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 "src/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 misc/manpage "$pkgdir/usr/share/man/man1/${_pkgname}.1"
  gzip -9n "$pkgdir/usr/share/man/man1/$_pkgname.1"
  install -Dm644 misc/"${_pkgname}.desktop" "$pkgdir/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 misc/completions.bash "$pkgdir/usr/share/bash-completion/completions/${_pkgname}"
  install -Dm644 misc/completions.zsh "$pkgdir/usr/share/zsh/site-functions/_${_pkgname}"
  install -Dm644 "translations/spanish/${_pkgname}.mo" "$pkgdir/usr/share/locale/es/LC_MESSAGES/${_pkgname}.mo"
  install -Dm644 misc/mimelist.cfm "$pkgdir/usr/share/$_pkgname/mimelist.cfm"
  install -Dm644 "images/logo/${_pkgname}.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg"
  cp -r plugins "$pkgdir/usr/share/$_pkgname"
  cp -r functions "$pkgdir/usr/share/$_pkgname"
}
