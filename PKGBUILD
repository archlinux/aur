# Maintainer: killab33z <killab33z @ protonmail-dot-ch>
pkgname=targetedkerberoast-git
_pkgname="${pkgname%-git}"
pkgver=r23.d77e642
pkgrel=1
pkgdesc="Kerberoast with ACL abuse capabilities"
arch=('any')
url="https://github.com/ShutdownRepo/targetedkerberoast"
license=(GPL-3.0-only)
depends=('python'
         'impacket'
         'python-ldap3'
         'python-pyasn1'
         'python-pycryptodome'
         'python-rich')
makedepends=('git')
provides=('targetedkerberoast')
conflicts=('targetedkerberoast' 'targetedkerberoast-bin')
source=("git+$url")
sha512sums=('SKIP')

# https://wiki.archlinux.org/title/VCS_package_guidelines
pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "$_pkgname"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$_pkgname" LICENSE
  install -Dm0755 $srcdir/$_pkgname/targetedKerberoast.py "$pkgdir/usr/bin/targetedkerberoast"
}

