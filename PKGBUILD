# Maintainer: GI_Jack <iamjacksemail@hackermail.com>
# Poached from Arch Strike
# Original: ArchStrike <team@archstrike.org>

pkgname=creds.py-git
pkgver=r17.1ec8297
pkgrel=1
pkgdesc="Harvest FTP/POP/IMAP/HTTP/IRC credentials along with interesting data from each of the protocols."
arch=('any')
url='https://github.com/DanMcInerney/creds.py'
license=('GPL2')
depends=('scapy')
makedepends=('git' 'python2')
provides=('creds.py')
source=("git+https://github.com/DanMcInerney/creds.py.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/creds.py"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare(){
  grep -iRl 'python' "$srcdir/creds.py" | xargs sed -i 's|#!.*/usr/bin/python|#!/usr/bin/python2|;s|#!.*/usr/bin/env python$|#!/usr/bin/env python2|'
}

package() {
  cd "$srcdir/creds.py"

  # Make base directories.
  install -Dm644 README.md "$pkgdir/usr/share/licenses/creds.py-git"
  install -Dm755 creds.py "$pkgdir/usr/bin/creds.py"

}
