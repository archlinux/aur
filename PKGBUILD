# Maintainer: Florian Pritz <flo@xinu.at>
# Contributor: Testuser_01 <mail@nico-siebler.de>

pkgname=swaks
pkgver=20190914.0
pkgrel=2
pkgdesc='Swiss Army Knife SMTP; Command line SMTP testing, including TLS and AUTH'
arch=('any')
url="https://jetmore.org/john/code/${pkgname}/"
license=('GPL')
depends=('perl-net-dns' 'perl-net-ssleay')
source=("https://jetmore.org/john/code/${pkgname}/files/${pkgname}-${pkgver}.tar.gz")
md5sums=('20e4986476af66923396eaeafb7e2727')

prepare() {
  cd "${pkgname}-${pkgver}"

  # fix perl 5.18 breakage
  sed -i 's#^=item \([0-9]\+\)$#=item C<\1>#' doc/ref.pod
}

package() {
  cd "${pkgname}-${pkgver}"
  install -m755 -D "${pkgname}" "$pkgdir/usr/bin/${pkgname}"
  cd doc
  pod2man ref.pod "${pkgname}.1"
  install -m644 -D "${pkgname}.1" "$pkgdir/usr/share/man/man1/${pkgname}.1"
}

