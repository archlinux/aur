# Maintainer: killab33z <killab33z @ protonmail-dot-ch>
pkgname=pre2k-git
_pkgname="${pkgname%-git}"
pkgver=r22.be66190
pkgrel=1
pkgdesc="Tool to query for existence of pre-windows 2000 computer objects which can be leveraged to gain a foothold in a target domain."
arch=('any')
url="https://github.com/garrettfoster13/pre2k-TS"
license=(MIT)
depends=('python'
         'impacket'
         'python-ldap3'
         'python-pyasn1'
         'python-rich')
makedepends=('git')
provides=('pre2k')
conflicts=('pre2k' 'pre2k-bin')
source=("git+$url")
sha512sums=('SKIP')

# https://wiki.archlinux.org/title/VCS_package_guidelines
pkgver() {
  cd "$_pkgname-TS"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "$_pkgname-TS"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$_pkgname" LICENSE
  install -Dm0755 $srcdir/$_pkgname-TS/pre2k.py "$pkgdir/usr/bin/pre2k"
}
