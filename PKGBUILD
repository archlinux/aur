# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

pkgname=sshtunnel-git
_gitname=sshtunnel
pkgver=0.1.1.1.g76e9320
pkgrel=1
pkgdesc="A tool to manage SSH tunnel to different hosts via systemd"
arch=('any')
url="http://g.cmpl.cc/sshtunnel"
license=('GPL')
depends=('openssh')
optdepends=('autossh: More stabile connections'
            'x11-ssh-askpass: To accept host keys')
makedepends=('git')
provides=('sshtunnel')
conflicts=('sshtunnel')
backup=('etc/sshtunnel.conf')
options=('emptydirs')
install=$pkgname.install
source=('git+http://git.the-compiler.org/sshtunnel')
sha1sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --always --tags | sed -e 's/-/./g' -e 's/^v//'
}

package() {
  cd "$srcdir/$_gitname"
  install -dm755 "$pkgdir/etc"
  install -dm755 "$pkgdir/usr/bin"
  install -dm755 "$pkgdir/usr/lib/systemd/system"
  install -o558 -g558 -dm770 "$pkgdir/var/lib/sshtunnel"
  install -Dm755 sshtunnel "$pkgdir/usr/bin"
  install -Dm644 sshtunnel.conf "$pkgdir/etc"
  install -Dm644 sshtunnel@.service "$pkgdir/usr/lib/systemd/system"
}

# vim:set ts=2 sw=2 et:
