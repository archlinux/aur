# Maintainer: Tercio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>
# Contributor: Hugo Courtial <hugo [at] courtial [not colon] me>
pkgname=natron-plugins-git
_pkgname=natron-plugins
pkgver=2.1.7.r1199.g19de003
pkgrel=1
arch=("any")
pkgdesc="A collection of Natron plugins made by the community"
url="https://github.com/NatronGitHub/natron-plugins"
license=("GPL2" "custom:CCPL2")
makedepends=("git")
depends=("natron")
provides=("natron-plugins")
install=natron-plugins.install
source=("$_pkgname::git+https://github.com/NatronGitHub/natron-plugins.git")
sha256sums=("SKIP")

pkgver() {
  cd $srcdir/$_pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  install -d "$pkgdir/usr/share/Natron/Plugins/$pkgname"
  install -d "$pkgdir/usr/share/licenses"
  install -d "$pkgdir/usr/OFX/Plugins/Shadertoy.ofx.bundle/Contents/Resources/presets/default"

  mv $srcdir/$_pkgname/Licenses/ \
     $pkgdir/usr/share/licenses/$pkgname

  mv $srcdir/$_pkgname/Shadertoy/Shadertoy.txt \
     $srcdir/$_pkgname/Shadertoy/Shadertoy.txt.natron-plugins

  touch $srcdir/$_pkgname/Shadertoy/Shadertoy.txt.original

  mv $srcdir/$_pkgname/Shadertoy/* \
     $pkgdir/usr/OFX/Plugins/Shadertoy.ofx.bundle/Contents/Resources/presets/default

  rmdir $srcdir/$_pkgname/Shadertoy/

  cp -r --preserve=mode,timestamps \
        $srcdir/$_pkgname/* \
        $pkgdir/usr/share/Natron/Plugins/$pkgname/
}
