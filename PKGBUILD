# Maintainer: killab33z <killab33z @ protonmail-dot-ch>
pkgname=extractbitlockerkeys-git
_pkgname="${pkgname%-git}"
pkgver=1.2.r15.gdbb7475
pkgrel=1
pkgdesc="System administration or post-exploitation script to automatically extract the bitlocker recovery keys from a domain."
arch=('any')
url="https://github.com/p0dalirius/extractbitlockerkeys"
license=(custom)
depends=('python'
         'python-sectools'
         'python-xlsxwriter')
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
  install -Dm0755 $srcdir/$_pkgname/python/ExtractBitlockerKeys.py "$pkgdir/usr/bin/$_pkgname"
}

