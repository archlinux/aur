pkgname=nsdiff
pkgver=1.81
pkgrel=1
pkgdesc="Create an 'nsupdate' script from DNS zone file differences"
url="https://dotat.at/prog/nsdiff/"
license=(CC0-1.0)
arch=(any)
depends=(
  bind          # named-compilezone
  bind-tools    # dig, nsupdate
  perl
)
provides=(
  nspatch=$pkgver
  nsvi=$pkgver
  perl-dns-nsdiff=$pkgver
)
options=(!emptydirs)
source=("https://dotat.at/prog/nsdiff/DNS-nsdiff-$pkgver.tar.gz")
sha256sums=('869dddadfe5f137855da41e1705a43dbf1f60d31374edc8822c827f2b7ed4d41')
#_commit=f2979fd03bbede624709700dfb65b26d94a0f2f2 # 1.81
#source=("git+https://github.com/fanf2/nsdiff.git#commit=$_commit")
#source=("git+https://git.uis.cam.ac.uk/x/uis/ipreg/nsdiff.git=$_commit")
#sha256sums=('SKIP')

build() {
  cd DNS-nsdiff-$pkgver
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd DNS-nsdiff-$pkgver
  make DESTDIR="$pkgdir" install
}

# vim: ts=2:sw=2:et
