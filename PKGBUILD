# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
pkgname=ecdsatool-git
pkgver=r23.7a196ce
pkgrel=4
pkgdesc="Creates and manipulates ECC NISTP256 keypairs"
arch=('i686' 'x86_64')
url="https://github.com/kaniini/ecdsatool"
license=('custom')
#depends=('')
#optdepends=('')
#makedepends=('')
_pkgname=ecdsatool
provides=("ecdsatool")
conflicts=("ecdsatool" "irssi-script-sasl")
install=
changelog=
noextract=()
source=("ecdsatool::git+https://github.com/kaniini/ecdsatool.git"
	"https://raw.githubusercontent.com/atheme/atheme/master/contrib/cap_sasl.pl")
sha512sums=('SKIP'
	    'SKIP')
pkgver() {
  cd "${srcdir}/${_pkgname}"
  # no tags, so number of revisions e.g. r1142.a17a017
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
        cd "${srcdir}/${_pkgname}"
        ./autogen.sh
	./configure --prefix=${pkgdir}/usr
	make -j
}
package() {
        cd "${srcdir}/${_pkgname}"
	make install
	install -Dm0644 "${srcdir}"/cap_sasl.pl "${pkgdir}"/usr/share/irssi/scripts/cap_sasl.pl
}
