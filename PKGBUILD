# Maintainer: Vain <aurmaint1 on host: uninformativ dot de>
_pkgname=sgopherd
pkgname=$_pkgname-git
pkgver=18.05.3.gfbaa246
pkgrel=1
pkgdesc="A gopher server written in Bash"
arch=('any')
url="https://uninformativ.de/git/sgopherd"
license=('MIT')
depends=('bash')
makedepends=('git')
backup=('etc/xinetd.d/sgopherd')
optdepends=('xinetd: Traditional way to run sgopherd'
            'systemd: sgopherd also works with socket activation')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(git+https://uninformativ.de/git/sgopherd.git)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --always | sed 's|-|.|g; s|v||'
}

package() {
  cd "$srcdir/$_pkgname"

  install -Dm755 sgopherd "$pkgdir"/usr/bin/sgopherd

  install -Dm644 xinetd/xinetd-example.conf "$pkgdir"/etc/xinetd.d/sgopherd

  install -Dm644 systemd/sgopherd@.service \
    "$pkgdir"/usr/lib/systemd/system/sgopherd@.service
  install -Dm644 systemd/sgopherd.socket \
    "$pkgdir"/usr/lib/systemd/system/sgopherd.socket

  install -Dm644 man8/sgopherd.8 "$pkgdir"/usr/share/man/man8/sgopherd.8
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
