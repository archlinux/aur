# Maintainer: killab33z <killab33z @ protonmail-dot-ch>
pkgname=silenthound-git
_pkgname="${pkgname%-git}"
pkgver=r27.f04746a
pkgrel=1
pkgdesc="Quietly enumerate Active Directory Domain via LDAP parsing users, admins, groups, etc."
arch=('any')
url="https://github.com/layer8secure/silenthound"
license=(MIT)
depends=('python'
         'python-alive-progress'
         'python-colorama'
         'python-ldap3')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
provides=('silenthound')
conflicts=('silenthound' 'silenthound-bin')
source=("git+$url")
sha512sums=('SKIP')

# https://wiki.archlinux.org/title/VCS_package_guidelines
pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "$_pkgname"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$_pkgname" LICENSE.md
  install -Dm0755 $srcdir/$_pkgname/silenthound.py "$pkgdir/usr/bin/silenthound"
}
