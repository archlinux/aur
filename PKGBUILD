# Maintainer: graysky <therealgraysky AT protonmail DOT com>
# Contributer: Bartłomiej Piotrowski <barthalion@gmail.com>
# Contributor: yugrotavele <yugrotavele at archlinux dot us>
# Contributor: Arkham <arkham at archlinux dot us>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Contributor: Arnaud Durand <biginozNOSPAM_at_free.dot.fr>
# Contributor: Nuno Araujo <nuno.araujo at russo79.com>

pkgname=bleachbit-cli
_pkgname=bleachbit
pkgver=4.4.2
pkgrel=5
pkgdesc='Deletes unneeded files to free disk space and maintain privacy. CLI version/no GUI.'
conflicts=($_pkgname)
provides=("bleachbit=${pkgver}")
arch=(any)
url='https://www.bleachbit.org/'
license=(GPL3)
depends=(python-gobject)
source=(https://github.com/bleachbit/bleachbit/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('6001c864688e36bd8f950c1341923c9347c2373149a9ce98dc26c39023b51997')

package() {
  cd $_pkgname-$pkgver

  make prefix=/usr DESTDIR="$pkgdir" install

  # suggestion by Meow to force script to operate in cli mode
  sed -i 's/if 1/if 0/' "$pkgdir"/usr/bin/bleachbit

  rm -rf "$pkgdir"/usr/share/{applications,pixmaps}
  rm -rf "$pkgdir"/usr/share/polkit-1
}
