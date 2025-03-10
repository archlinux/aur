# Maintainer:  Jefferson Carneiro <slackjeff at slackjeff dot com dot br>
# Contributor: Francois Menning <f.menning@protonmail.com>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: yugrotavele <yugrotavele at archlinux dot us>
# Contributor: Arkham <arkham at archlinux dot us>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Contributor: Arnaud Durand <biginozNOSPAM_at_free.dot.fr>
# Contributor: Nuno Araujo <nuno.araujo at russo79.com>

_pkgname=bleachbit
pkgname=$_pkgname-git
pkgver=r12.3ac8e8d
pkgrel=1
pkgdesc='Deletes unneeded files to free disk space and maintain privacy.'
url='https://www.bleachbit.org/'
license=('GPL-3.0-or-later' 'MIT')
source=("${_pkgname}::git+https://github.com/bleachbit/bleachbit.git")
sha256sums=('SKIP')
arch=('any')
depends=('python-gobject' 'gtk3')
optdepends=('cleanerml-git: Bonus cleaner pack')
makedepends=('git')
conflicts=('bleachbit')
provides=('bleachbit')

pkgver() {
  cd ${_pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd ${_pkgname}
  make prefix=/usr DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
