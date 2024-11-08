# Maintainer: killab33z <killab33z @ protonmail-dot-ch>
pkgname=adpeas-git
_pkgname="${pkgname%-git}"
pkgver=1.3.0.r12.g58462f3
pkgrel=1
pkgdesc="winPEAS, but for Active Directory"
arch=('any')
url="https://github.com/ajm4n/adpeas"
license=(custom)
depends=('python'
         'bloodhound'
         'certi'
         'certipy'
         'impacket'
         'netexec'
         'python-importlib-metadata'
         'python-ldap3'
         'python-regex')
makedepends=('git' 'python-setuptools')
provides=("$_pkgname")
conflicts=("$_pkgname" "$pkgname-bin")
source=("git+$url")
sha512sums=('SKIP')

# https://wiki.archlinux.org/title/VCS_package_guidelines
pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

# https://wiki.archlinux.org/title/Python_package_guidelines
build() {
  cd "$_pkgname"
  python setup.py build
}

package() {
  cd "$_pkgname"
  python setup.py install --root="$pkgdir" --optimize=1
}

