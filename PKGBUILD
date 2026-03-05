# Maintainer: Your Name <your@email.com>
pkgname=pinterest-unshittifier-git
pkgver=1.0.0
pkgrel=4
pkgdesc="Daemon to fix Pinterest filenames and extensions in Downloads"
arch=('any')
url="https://github.com/Tok1shu/pinterest-unshittifier"
license=('MIT')
depends=('python' 'python-watchdog')
makedepends=('git')
install=${pkgname}.install
source=("${pkgname}::git+${url}"
        "pinterest-unshittifier.service")
sha256sums=('SKIP'
            'fdae1ab09dfd1cbdd830a6c2eb821def3d35984e81c7e4b84ea81e4176c7d94c')

package() {
  cd "$srcdir/$pkgname"

  install -Dm755 main.py "$pkgdir/usr/share/$pkgname/main.py"

  mkdir -p "$pkgdir/usr/bin"
  printf "#!/bin/bash\npython /usr/share/$pkgname/main.py \"\$@\"" > "$pkgdir/usr/bin/pinterest-unshittifier"
  chmod +x "$pkgdir/usr/bin/pinterest-unshittifier"

  install -Dm644 "$srcdir/pinterest-unshittifier.service" \
    "$pkgdir/usr/lib/systemd/user/pinterest-unshittifier.service"
}
