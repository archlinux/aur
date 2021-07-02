# Maintainer: graysky <graysky AT archlinux DOT us>
# Contributer: Bartłomiej Piotrowski <barthalion@gmail.com>
# Contributor: yugrotavele <yugrotavele at archlinux dot us>
# Contributor: Arkham <arkham at archlinux dot us>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Contributor: Arnaud Durand <biginozNOSPAM_at_free.dot.fr>
# Contributor: Nuno Araujo <nuno.araujo at russo79.com>

pkgname=bleachbit-cli
_pkgname=bleachbit
pkgver=4.4.0
pkgrel=1
pkgdesc='Deletes unneeded files to free disk space and maintain privacy. CLI version/no GUI.'
conflicts=($_pkgname)
provides=("bleachbit=${pkgver}")
arch=(any)
url='https://www.bleachbit.org/'
license=(GPL3)
depends=(python-gobject)
source=($_pkgname-$pkgver.tar.gz::https://github.com/bleachbit/bleachbit/archive/v$pkgver.tar.gz)
b2sums=('1a3012ab0f69604170155d9b02ab37535c67a4212f146599e61a1eafc499e87733871f53587f4b04dbac2b9d8c83308bc09390f30c8ed7bdb0cbc8f9941580b1')

package() {
  cd $_pkgname-$pkgver

  make prefix=/usr DESTDIR="$pkgdir" install

  # suggestion by Meow to force script to operate in cli mode
  sed -i 's/if 1/if 0/' "$pkgdir"/usr/bin/bleachbit

  rm -rf "$pkgdir"/usr/share/{applications,pixmaps}
  rm -rf "$pkgdir"/usr/share/polkit-1
}
