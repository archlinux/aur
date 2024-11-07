# Maintainer: killab33z <killab33z @ protonmail-dot-ch>
pkgname=rdwatool-git
_pkgname="${pkgname%-git}"
pkgver=1.2.r12.g6c47a21
pkgrel=2
pkgdesc="Python script to extract information from a Microsoft Remote Desktop Web Access (RDWA) application"
arch=('any')
url="https://github.com/p0dalirius/rdwatool"
license=(custom)
depends=('python'
         'python-beautifulsoup4'
         'python-requests'
         'python-urllib3<2'
         'python-xlsxwriter')
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

