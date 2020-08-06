# Maintainer: Angel Perez <near1297@nauta.cu>
# Maintainer: Miguel Revilla <yo@miguelrevilla.com>
pkgname=alien_package_converter
pkgver=8.95
pkgrel=5
pkgdesc="Alien is a program that converts between the rpm, dpkg, stampede slp, and slackware tgz file formats"
arch=('any')
url="http://joeyh.name/code/alien/"
license=('GPL2')
depends=('perl' 'debhelper' 'cpio' 'rpm-org' 'bzip2')
makedepends=('perl')
options=('!emptydirs')
source=("http://ftp.de.debian.org/debian/pool/main/a/alien/alien_$pkgver.tar.xz")
sha256sums=('37a22587c33810feab323474bdadbf969fda2eb4e720b2ca01b40d82d6f71a17')

build() {
cd "${srcdir}/alien-${pkgver}"
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
cd "${srcdir}/alien-${pkgver}"
make DESTDIR="${pkgdir}" install
}
