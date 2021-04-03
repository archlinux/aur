# Maintainer: graysky <graysky AT archlinux DOT us>
# Contributer: Bartłomiej Piotrowski <barthalion@gmail.com>
# Contributor: yugrotavele <yugrotavele at archlinux dot us>
# Contributor: Arkham <arkham at archlinux dot us>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Contributor: Arnaud Durand <biginozNOSPAM_at_free.dot.fr>
# Contributor: Nuno Araujo <nuno.araujo at russo79.com>

pkgname=bleachbit-cli
_pkgname=bleachbit
pkgver=4.2.0
pkgrel=1
pkgdesc='Deletes unneeded files to free disk space and maintain privacy. CLI version/no GUI.'
conflicts=($_pkgname)
provides=("bleachbit=${pkgver}")
arch=(any)
url='https://www.bleachbit.org/'
license=(GPL3)
depends=(python-gobject)
source=($_pkgname-$pkgver.tar.gz::https://github.com/bleachbit/bleachbit/archive/v$pkgver.tar.gz
maximize-infinite-loop.patch::"https://github.com/bleachbit/bleachbit/commit/933ea605.patch")
b2sums=('de682ca97bbd2f784f1fae29fb86c84e3643756ec0819fbbc1c0dedabfbfc3a9f2e0526e151a94d953132176817c503381447caaabc18f7acbcca67185800675'
        '241b397e4ea74957bb247bf21c833f8c0c8ad801b10bf7594d1e032d6b2437c58186960bacdd051cd660bfeda38ac924244fef15ada13934341c365ae54ce5f6')

package() {
  cd $_pkgname-$pkgver

  make prefix=/usr DESTDIR="$pkgdir" install

  # suggestion by Meow to force script to operate in cli mode
  sed -i 's/if 1/if 0/' "$pkgdir"/usr/bin/bleachbit

  rm -rf "$pkgdir"/usr/share/{applications,pixmaps}
  rm -rf "$pkgdir"/usr/share/polkit-1
}
