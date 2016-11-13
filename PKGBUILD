# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: max.bra <max.bra at alice dot it>
# Contributor: Marius Nestor <marius at softpedia dot com>
# Contributor: mathewv <mathewvq at gmail dot com>
# Contributor: Davi da Silva Böger <dsboger@gmail.com>

pkgname=gnome-exe-thumbnailer
pkgver=0.9.3
pkgrel=3
pkgdesc="Wine executable (.exe/.msi/.dll/.lnk) thumbnailer for GNOME"
arch=('any')
url="https://launchpad.net/ubuntu/+source/gnome-exe-thumbnailer"
license=('LGPL2.1')
depends=('bash' 'imagemagick' 'icoutils' 'glib2')
optdepends=('wine: to support .msi installers and .lnk shortcuts')
source=("https://launchpad.net/ubuntu/+archive/primary/+files/${pkgname}_${pkgver}-2_all.deb")
sha256sums=('d4e94813b8e16667762a04ce06d5fd19542a410f5a33de9e5f6938b8365c6104')

prepare() {
  bsdtar xf data.tar.xz
}

package() {
  install -Dm0755 usr/bin/$pkgname "$pkgdir"/usr/bin/$pkgname

  cd usr/share
  install -Dm0644 thumbnailers/exe-dll-msi.thumbnailer \
    "$pkgdir"/usr/share/thumbnailers/exe-dll-msi.thumbnailer

  install -Dm0644 man/man1/$pkgname.1.gz "$pkgdir"/usr/share/man/man1/$pkgname.1.gz

  install -d "$pkgdir"/usr/share/pixmaps
  cp -r pixmaps/$pkgname "$pkgdir"/usr/share/pixmaps
}
