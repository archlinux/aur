# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=gpx2png-git
_pkgname=gpx2png
pkgver=r13.8471358
pkgrel=1
pkgdesc="Perl script that turns GPX file(s) into image with a background map"
arch=('any')
url="https://wiki.openstreetmap.org/wiki/Gpx2png"
license=('GPL3')
depends=('perl-libwww' 'imagemagick')
conflicts=('gpx2png')
source=("${_pkgname}"::'git+https://gitorious.org/tfscripts/openstreetmap.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${_pkgname}/${_pkgname}"
  sed -i '1i\
#!/usr/bin/env perl' gpx2png.pl
}

package() {
  cd "$srcdir/${_pkgname}/${_pkgname}"
  install -Dm755 gpx2png.pl "${pkgdir}/usr/bin/gpx2png.pl"
}
