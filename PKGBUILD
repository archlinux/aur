# Maintainer: Tercio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>
# Contributor: Hugo Courtial <hugo [at] courtial [not colon] me>
pkgname=natron-plugins-git
_pkgname=natron-plugins
pkgver=2.1.7.r1062.g72d4bb5
_commit=72d4bb5
pkgrel=1
arch=("i686" "x86_64")
pkgdesc="A collection of Natron plugins made by the community"
url="https://github.com/NatronGitHub/natron-plugins"
license=("GPL2" "custom:CCPL2")
makedepends=("git")
depends=("natron")
provides=("natron-plugins")
conflicts=("natron-plugins")
source=("$_pkgname::git://github.com/NatronGitHub/natron-plugins#commit=$_commit")
sha256sums=("SKIP")

pkgver() {
  cd $srcdir/$_pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  mkdir -p "$pkgdir/usr/share/Natron/Plugins/$_pkgname"
  mkdir -p "$pkgdir/usr/share/licenses"

  mv $srcdir/$_pkgname/Licenses/ \
     $pkgdir/usr/share/licenses/$pkgname

  cp -r --preserve=mode,timestamps \
        $srcdir/$_pkgname/* \
        $pkgdir/usr/share/Natron/Plugins/$_pkgname/
}
