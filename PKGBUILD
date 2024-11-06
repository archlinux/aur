# Maintainer: killab33z <killab33z @ protonmail-dot-ch>
pkgname=certi-git
_pkgname="${pkgname%-git}"
pkgver=r6.6cfa656
pkgrel=1
pkgdesc="Active Directory Certificate Services (ADCS) abuser. impacket copy of Certify."
arch=('any')
url="https://github.com/zer1t0/certi"
license=(AGPL-3.0-only)
depends=('python'
         'python-cryptography'
         'impacket')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
provides=('certi')
conflicts=('certi' 'certi-bin')
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
  install -Dm0755 $srcdir/$_pkgname/certi.py "$pkgdir/usr/bin/certi.py"
}
