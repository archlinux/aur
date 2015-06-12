# Maintainer: Nicolas Leclercq <nicolas.private@gmail.com>

pkgname='facette'
pkgver='0.2.3'
pkgrel='1'
epoch=
pkgdesc='Facette is a software to display time series data from several various sources'
arch=('i686' 'x86_64')
url='http://facette.io/'
license=('BSD')
groups=()
depends=('rrdtool')
makedepends=('pkg-config' 'go' 'nodejs' 'pandoc-static')
checkdepends=()
optdepends=()
provides=('facette')
conflicts=()
replaces=()
backup=()
options=()
install='facette.install'
changelog=
source=(
  "https://github.com/facette/facette/archive/$pkgver.tar.gz"
  'facette.service'
  'facette.install')
noextract=()
md5sums=('7d9882bdf42660f771e16881e4868006'
         'SKIP'
         'SKIP')
_prefix='/usr/local'

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=${pkgdir}/${_prefix} install

	# create target directory structure
	mkdir -p ${pkgdir}/{etc/facette,var/log/facette,var/run/facette}

	# default config
  cp docs/examples/facette.json  ${pkgdir}/etc/facette
  cp -r docs/examples/providers  ${pkgdir}/etc/facette

	# copy systemd service file
  install -D -m644 $srcdir/facette.service $pkgdir/usr/lib/systemd/system/facette.service
}

