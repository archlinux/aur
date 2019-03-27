# Maintainer:
# Contributor:  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Maciej Sitarz <macieks@freesco.pl>

pkgname=hyphen-pl
pkgver=20081206
pkgrel=3
pkgdesc='Polish hyphenation rules'
arch=('any')
url='http://extensions.services.openoffice.org/en/project/pl-dict'
license=('LGPL')
optdepends=('hyphen: offers hyphenation library functions')
source=(https://sources.archlinux.org/other/community/$pkgname/$pkgname-$pkgver.tar.xz{,.sig})
validpgpkeys=('F3691687D867B81B51CE07D9BBE43771487328A9') # Bartłomiej Piotrowski
md5sums=('7ecdc3975750d6d2de1e6045f5003ed4'
         'SKIP')

package() {
  cd $pkgname-$pkgver

  install -Dm644 hyph_pl_PL.dic "$pkgdir"/usr/share/hyphen/hyph_pl_PL.dic

  install -dm755 "$pkgdir"/usr/share/myspell/dicts
  pushd "$pkgdir"/usr/share/myspell/dicts
    for file in "$pkgdir"/usr/share/hyphen/*; do
      ln -sv /usr/share/hyphen/$(basename $file) .
    done
  popd
}
