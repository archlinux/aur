# Maintainer: Daniel Plank <tyrolyean@gmx.at>
pkgname=electric
_pkgver_out=9.09b
pkgver="${_pkgver_out}.1"
pkgrel=2
pkgdesc="a sophisticated electrical CAD system for the design of \
        integrated circuits"
arch=(any)
url="https://www.gnu.org/software/electric/"
license=('GPL')
depends=('java-environment' 'bash')
makedepends=('svn' 'java-environment-openjdk<=17' 'java-environment-openjdk>=17' 'apache-ant')
provides=(gnu-electric)
source=("svn://svn.savannah.gnu.org/electric"
        "https://www.gnu.org/software/$pkgname/$pkgname.jpg"
        "electric.desktop"
        "electric.sh")
sha512sums=('SKIP'
            '7c0d30876202dfad4f1297db49489e7e3b6bd49dfbbb2b6919cd2075a6285d71d6bde64834ced322af6bc14ee2b1503a65add7f3c48114edfc836202153bb9be'
            '08364432f2161c59096e5d7b0087122b41e9a4b7aa66fdb041b1035020085a1929bc636ac811bac64bd1a1dd8dfb0cec50279b1481a6a2241d646fcba2e8fca9'
            '9fc25916ffa6536710016a313dfeab4a05de3d1a0818edb46a2e9c3c1eb850f82884383652e9ca1860c50ba6d4bab9cd818477606afffe522644f475ef22ba4b')

build() {
        cd "$pkgname/trunk/$pkgname/packaging/"
        ant
}

package() {


        install -D -m 0555 "$pkgname/trunk/$pkgname/packaging/${pkgname}Binary-$_pkgver_out.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
        install -D -m 0444 "$pkgname.jpg" "$pkgdir/usr/share/icons/$pkgname.jpg"
        install -D -m 0555 "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
	install -D -m 0444 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
