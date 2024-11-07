# Maintainer: killab33z <killab33z @ protonmail-dot-ch>
pkgname=ldapmonitor-git
_pkgname="${pkgname%-git}"
pkgver=1.4.r12.g498e048
pkgrel=1
pkgdesc="Monitor creation, deletion and changes to LDAP objects live during your pentest or system administration!"
arch=('any')
url="https://github.com/p0dalirius/ldapmonitor"
license=(custom)
depends=('python'
         'python-ldap3'
         'python-pycryptodome'
         'python-sectools>=1.4.3')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname" "$pkgname-bin")
source=("git+$url")
sha512sums=('SKIP')

# https://wiki.archlinux.org/title/VCS_package_guidelines
pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$_pkgname"
  install -Dm0755 $srcdir/$_pkgname/python/pyLDAPmonitor.py "$pkgdir/usr/bin/pyldapmonitor"
  install -Dm0644 $srcdir/$_pkgname/LICENCE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}

