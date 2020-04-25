# Maintainer: Andre Schröder <andre.schroedr at gmail dot com>

# All my PKGBUILDs are managed at https://github.com/schra/pkgbuilds

_name=bats-core
pkgname=$_name
pkgver=1.2.0
_mainfolder=$_name-$pkgver
pkgrel=1
pkgdesc='Bash Automated Testing System'
arch=(any)
url=https://github.com/bats-core/bats-core
license=(MIT)
depends=(bash)
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz fix-libexec-path.patch)
sha256sums=('c74ea5517d9381c044e8e87427de0113be6ad591213d489aeaa28146daf1c723'
            '89a7f67f4590abbada4b735174db1e7694cc83a371d4668c3150866340898dbd')
conflicts=(bash-bats)
provides=(bash-bats)

check() {
  cd "$srcdir/$_mainfolder"
  bin/bats --tap test
}

package() {
  cd "$srcdir/$_mainfolder"

  patch -p1 -i "$srcdir/fix-libexec-path.patch"

  install -dm755 "$pkgdir"/{usr/bin,usr/lib/bats,usr/share/man/man{1,7},usr/share/licenses/$_name}
  install -m 755 "bin"/* "$pkgdir/usr/bin"
  install -m 755 "libexec/bats-core"/* "$pkgdir/usr/lib/bats"
  install -m 644 "man/bats.1" "$pkgdir/usr/share/man/man1"
  install -m 644 "man/bats.7" "$pkgdir/usr/share/man/man7"
  install -m 644 LICENSE.md "$pkgdir"/usr/share/licenses/$_name/LICENSE.md
}
