# Maintainer: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>

pkgname=strace-analyzer
pkgver=0.2.2
pkgrel=1
pkgdesc="analyzes strace output"
arch=(any)
url="https://github.com/wookietreiber/strace-analyzer"
license=('GPL')
depends=('java-environment' 'bash')
source=("https://github.com/wookietreiber/strace-analyzer/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz"{,.asc})
md5sums=('8e4d432388d6f36f49e5d0b5fe25163b'
         'SKIP')
validpgpkeys=(# Christian Krause <christian.krause@mailbox.org>
              # https://pgp.mit.edu/pks/lookup?op=get&search=0xD8A6485D41708D7B
              D6117C56E0DDF9B5ADF18E5ED8A6485D41708D7B)

package() {
  cd $srcdir/$pkgname-$pkgver

  install -Dm755 bin/strace-analyzer $pkgdir/usr/share/$pkgname/bin/strace-analyzer

  for jar in lib/* ; do
    install -Dm644 $jar $pkgdir/usr/share/$pkgname/$jar
  done

  install -Dm644 share/$pkgname/NOTICE.md $pkgdir/usr/share/$pkgname/NOTICE.md
  install -Dm644 share/bash-completion/completions/strace-analyzer $pkgdir/usr/share/bash-completion/completions/strace-analyzer
  install -Dm644 share/man/man1/strace-analyzer.1 $pkgdir/usr/share/man/man1/strace-analyzer.1

  install -d $pkgdir/usr/bin
  cd $pkgdir/usr/bin
  ln -s ../share/$pkgname/bin/strace-analyzer
}
