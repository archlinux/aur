# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgname=codemetre
pkgver=0.31.2
pkgrel=1
pkgdesc="A console-based tool counting lines of code in a file"
arch=('i686' 'x86_64')
url="http://wiki.github.com/seventh/codemetre"
license=('GPL3')
depends=('glibc')
source=(http://codemetre.free.fr/$pkgname-$pkgver.tar.bz2)
md5sums=('8037be694f697f00b98ba7fe262097f0')

build() {
  cd "${srcdir}"/$pkgname-$pkgver/src/c

  gcc ${CFLAGS} -Wall -c luat_$pkgname.c
  gcc ${CFLAGS} -Wall -o $pkgname luat_$pkgname.o -lm
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver/src/c

  install -Dm755 $pkgname "${pkgdir}"/usr/bin/$pkgname

  cd "${srcdir}"/$pkgname-$pkgver
  install -d "${pkgdir}"/usr/share/{doc,man}
  cp -rf doc/ "${pkgdir}"/usr/share/doc/$pkgname/
  cp -rf i18n/ "${pkgdir}"/usr/share/locale/
  cp -rf man/ "${pkgdir}"/usr/share/man/man1/
}
