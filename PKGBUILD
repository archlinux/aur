# Maintainer: killab33z <killab33z @ protonmail-dot-ch>
pkgname=adpeas-git
_pkgname="${pkgname%-git}"
pkgver=1.3.0.r15.g0bfcedc
pkgrel=1
pkgdesc="winPEAS, but for Active Directory"
arch=('any')
url="https://github.com/ajm4n/adpeas"
license=('MIT')
depends=('python'
         'bloodhound'
         'certi'
         'certipy'
         'impacket'
         'netexec'
         'python-beautifulsoup4'
         'python-importlib-metadata'
         'python-ldap3'
         'python-regex'
         'python-termcolor')
makedepends=('git' 'python-setuptools')
provides=("$_pkgname")
conflicts=("$_pkgname" "$pkgname-bin")
source=("git+$url"
        "beautifulsoup4.patch")
sha512sums=('SKIP'
            '2b558a8ffcce156ae7956d088ac06d0f0bf221fac3b4a0e251a39404a10b321ea96bf26b7184540974ec740222c9a51db2f0927eb73afff38ae9321b1eabdb8e')

# https://wiki.archlinux.org/title/VCS_package_guidelines
pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

# https://wiki.archlinux.org/title/Patching_packages
prepare() {
  cd "$_pkgname"
  patch -Np1 -i ../beautifulsoup4.patch
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

