# Maintainer: Tercio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>
# Contributor: Hugo Courtial <hugo [at] courtial [not colon] me>
pkgname=natron-plugins
pkgver=2.1.7.r1177.g456618b
_commit=456618b
pkgrel=1
arch=("any")
pkgdesc="A collection of Natron plugins made by the community"
url="https://github.com/NatronGitHub/natron-plugins"
license=("GPL2" "custom:CCPL2")
depends=("natron")
install=natron-plugins.install
source=("$pkgname-$_commit.tar.gz::$url/tarball/$_commit")
sha256sums=("SKIP")

_pkgname="NatronGitHub-$pkgname-$_commit"

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
