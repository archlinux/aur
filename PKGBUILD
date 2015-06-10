# Maintainer:
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Andreas Wagner <Andreas dot Wagner at em dot uni-frankfurt dot de>

pkgname=sux
pkgver=1.0.1
pkgrel=3
pkgdesc='Wrapper around su which will transfer your X credentials'
arch=('any')
url='http://sourceforge.net/projects/sux/'
license=('custom')
depends=('coreutils' 'xorg-xauth')
source=("http://downloads.sourceforge.net/project/sux/sux/$pkgver/sux-$pkgver.tar.gz")
md5sums=('73613f8515e0d90bdd9e871b6fe2e2eb')

build() {
  cd "sux-$pkgver"

  sed -i -e 's|tempfile -p sux|mktemp --tmpdir sux.XXXXXXXXXX|' sux
  sed -i -e 's|tempfile -p sux|mktemp --tmpdir sux.XXXXXXXXXX|' suxterm
}

package() {
  cd "sux-$pkgver"

  install -Dm775 sux  ${pkgdir}/usr/bin/sux
  install -Dm775 suxterm  ${pkgdir}/usr/bin/suxterm
  install -Dm644 debian/sux.1 ${pkgdir}/usr/share/man/man1/sux.1
  install -Dm644 debian/suxterm.1 ${pkgdir}/usr/share/man/man1/suxterm.1
  install -Dm644 debian/copyright ${pkgdir}/usr/share/licenses/sux/COPYING
}

# vim:set ts=2 sw=2 et:
