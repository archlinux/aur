# prokit can install a ProteanOS system, run a ProteanOS shell and other
# commands, manage software packages in an installed ProteanOS system, and
# build packages for ProteanOS (with build dependencies automatically
# installed and removed).
#
# prokit is similar in function to the debootstrap, pbuilder, and sbuild
# programs of Debian and derivatives.

# First Linux Arch packager: Serge Victor <arch@random.re>

_pkgname=prokit
pkgname=$_pkgname-git
pkgver=r445.84f3ccc
pkgrel=1
pkgdesc="The ProteanOS Development Kit"
arch=('any')
url="http://proteanos.com/dev/prokit/"
license=('GPL3')
depends=('bash')
source=('git+git://git.proteanos.com/prokit/prokit.git/')
md5sums=('SKIP')

pkgver() {
    cd $_pkgname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_pkgname"
    ./autogen.sh
    ./configure --prefix=/usr
}

package() {
    cd "$srcdir/$_pkgname"
    make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
