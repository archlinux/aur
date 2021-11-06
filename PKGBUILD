# Contributor: Simon Lundström <simlu@su.se>
# Maintainer: Simon Lundström <simlu@su.se> (or you?)

pkgname=rancid
pkgver=3.13
pkgrel=1
pkgdesc="Really Awesome New Cisco confIg Differ"
arch=('i686' 'x86_64' 'armv7h')
url="http://www.shrubbery.net/rancid/"
license=('BSD')
depends=('expect')
backup=('etc/rancid.conf')
source=( https://shrubbery.net/pub/rancid/${pkgname}-${pkgver}.tar.gz{,.asc} )
md5sums=('7146e8aafb0d2d6906167f8acb83c3a4' '732718edd6501ff14a8ba40ba33fd1fc')
sha256sums=('7241d2972b1f6f76a28bdaa0e7942b1257e08b404a15d121c9dee568178f8bf5' 'f36711a821976689aaf58cf99dc014fea0feb3805044547047e76c4615acc7a7')
validpgpkeys=('321D8166DE7230F9241C06ADFC860A57C2B34FCB')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --libexecdir=/usr/lib
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  make DESTDIR=${pkgdir} install

  # ...
  install -D -m644 "${pkgdir}/usr/share/rancid/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
