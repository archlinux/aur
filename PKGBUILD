#Maintainer: Jan Dolinar <dolik.rce@gmail.com>
#Contributor: A. Klitzing <aklitzing@gmail.com>

pkgname=pbuilder-ubuntu
pkgver=0.222
pkgrel=1
pkgdesc="personal package builder for Debian packages"
arch=(any)
url="https://launchpad.net/ubuntu/+source/pbuilder"
license=('GPL')
depends=('debootstrap' 'dpkg' 'coreutils' 'wget' 'debianutils' 'perl-timedate')
optdepends=('ubuntu-keyring: checking release signatures of ubuntu distributions'
	'debian-archive-keyring: checking release signatures of debian distributions'
	'debian-keyring: checking release signatures of debian distributions (alternative package)')
provides=('pbuilder')
conflicts=('pbuilder')
source=(http://archive.ubuntu.com/ubuntu/pool/main/p/pbuilder/pbuilder_${pkgver}_all.deb)
backup=('etc/pbuilderrc')
md5sums=('2bb33288dd3995e33266a9cee5cc5cc3')

package() {
  ar x pbuilder_${pkgver}_all.deb
  tar xJf data.tar.xz -C "$pkgdir"

  cp "$pkgdir/usr/share/pbuilder/pbuilderrc" "$pkgdir/etc/pbuilderrc"

  # move the executables to /usr/bin
  mkdir -p /usr/bin
  mv "$pkgdir/usr/sbin"/* "$pkgdir/usr/bin/"
  rmdir "$pkgdir/usr/sbin"
}
