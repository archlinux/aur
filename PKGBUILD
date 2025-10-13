# Maintainer: Angel Perez <near1297@nauta.cu>
# Maintainer: Miguel Revilla <yo@miguelrevilla.com>
# Maintainer: curlywei dewei0724@gmail.com

pkgname=alien_package_converter
pkgver=8.95
pkgrel=8
pkgdesc="Alien is a program that converts between the rpm, dpkg, stampede slp, and slackware tgz file formats"
arch=('any')
url="http://joeyh.name/code/alien/"
license=('GPL2')
depends=('perl' 'debhelper' 'cpio' 'rpm-org' 'bzip2')
makedepends=('perl')
options=('!emptydirs')
source=("https://ftp.debian.org/debian/pool/main/a/alien/alien_${pkgver}.${pkgrel}.tar.xz")
sha256sums=('586A649BC9366ACC15047D4C9F34E253208907142E12174EAFB4F3704FEA47A5')

build() {
cd "${srcdir}/alien"
  # Setting these env variables overwrites any command-line-options we don't want...
export PERL_MM_USE_DEFAULT=1 \
PERL5LIB="" \
PERL_AUTOINSTALL=--skipdeps \
PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='${pkgdir}'" \
PERL_MB_OPT="--installdirs vendor --destdir '${pkgdir}'" \
MODULEBUILDRC=/dev/null

perl Makefile.PL
make
}

package() {
cd "${srcdir}/alien"
make DESTDIR="${pkgdir}" install
}
