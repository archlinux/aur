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
pkgrel=1
pkgdesc='Deletes unneeded files to free disk space and maintain privacy. CLI version/no GUI.'
conflicts=($_pkgname)
provides=("bleachbit=${pkgver}")
arch=(any)
url='https://www.bleachbit.org/'
license=(GPL3)
depends=(python-gobject)
source=($_pkgname-$pkgver.tar.gz::https://github.com/bleachbit/bleachbit/archive/v$pkgver.tar.gz)
b2sums=('a44adccdf895ccc5530da71ef8f6eb3232283412851300d2c6c8b8ae5d477bb9f619a14ba1e6d808e825342d82705269523a7ed0ba070fcffb6f02c8ffe0e98e')

package() {
  cd $_pkgname-$pkgver

  make prefix=/usr DESTDIR="$pkgdir" install

  # suggestion by Meow to force script to operate in cli mode
  sed -i 's/if 1/if 0/' "$pkgdir"/usr/bin/bleachbit

  rm -rf "$pkgdir"/usr/share/{applications,pixmaps}
  rm -rf "$pkgdir"/usr/share/polkit-1
}
