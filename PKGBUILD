# Maintainer: killab33z <killab33z @ protonmail-dot-ch>
pkgname=finduncommonshares-git
_pkgname="${pkgname%-git}"
_pkgname_upstream="pyfinduncommonshares"
pkgver=3.2.r10.g665eb4c
pkgrel=1
pkgdesc="Python script allowing to quickly find uncommon shares in vast Windows Domains..."
arch=('any')
url="https://github.com/p0dalirius/pyfinduncommonshares"
license=('GPL-2.0-only')
depends=('python'
         'impacket'
         'python-xlsxwriter'
         'python-sectools'
         'python-pycryptodome')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-bin")
source=("git+$url")
sha512sums=('SKIP')

# https://wiki.archlinux.org/title/VCS_package_guidelines
pkgver() {
  cd "$_pkgname_upstream"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  install -Dm0755 $srcdir/$_pkgname_upstream/FindUncommonShares.py "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 $srcdir/$_pkgname_upstream/LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
}

