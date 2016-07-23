# Maintainer: Étienne Deparis <etienne@depar.is>
# Contributor: Charles Bos <charlesbos1 AT gmail>
# Contributor: Shawn Dellysse <sdellysse@radford.edu>

pkgname=bluecurve-icon-theme
pkgver=8.0.2
pkgrel=13
_rhfedver=24
_rhpkgrel=12
_rhpkgver=23
pkgdesc="Red Hat Icons from Fedora 10"
arch=('any')
url="https://fedorahosted.org/bluecurve/"
license=('GPL')
groups=('redhat-artwork')
optdepends=(
  'gnome-icon-theme: for inheriting missing icons'
)

source=("ftp://rpmfind.net/linux/fedora/linux/releases/${_rhfedver}/Everything/x86_64/os/Packages/b/bluecurve-icon-theme-${pkgver}-${_rhpkgrel}.fc${_rhpkgver}.noarch.rpm")
sha256sums=('25d69cd3bff37bc346d482b4453e728bdaf39766c6a847dd83fff4dec3098792')

build() {
  cd $srcdir/usr/share/icons
  mv Bluecurve BluecurveRH
  sed -i s/Name=Bluecurve/Name=BluecurveRH/ BluecurveRH/index.theme
}

package() {
  install -d -m755 $pkgdir/usr/share/icons
  install -d -m755 $pkgdir/usr/share/licenses/$pkgname

  cd $srcdir/usr/share/doc/$pkgname
  install -D -m644 COPYING $pkgdir/usr/share/licenses/$pkgname/LICENSE
  install -D -m644 AUTHORS $pkgdir/usr/share/licenses/$pkgname/AUTHORS

  cp -R $srcdir/usr/share/icons/BluecurveRH $pkgdir/usr/share/icons/
}
