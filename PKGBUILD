# Maintainer: Matthew Hague <matthewhague@zoho.com>

_npmname=imapnotify
pkgname=nodejs-imapnotify-git
pkgver=r39.f886715
pkgrel=1
pkgdesc='Execute scripts on new messages using IDLE imap command'
arch=(any)
url="https://github.com/titibandit/node-imapnotify"
license=('MIT')
depends=('nodejs')
optdepends=()
makedepends=('npm')
install=$pkgname.install
conflicts=('nodejs-imapnotify')
source=($pkgname::git+https://github.com/titibandit/node-imapnotify
        imapnotify@.service)
sha256sums=('SKIP'
            'e101ef974e5c342f7a69177fb5ae1c341b4c39c911993eaa97a0917bddc5cc11')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $srcdir/$pkgname
  PYTHON=/usr/bin/python2 npm install -g --prefix "$pkgdir/usr" $_npmname
  install -Dm644 "${srcdir}/imapnotify@.service" "${pkgdir}/usr/lib/systemd/user/imapnotify@.service"
}
