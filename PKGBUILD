# Maintainer: Björn <theodorstormgrade@gmail.com>
pkgname=scratchbox2
pkgver=2.3.90+git2.r76.fc3eefe
pkgrel=1
pkgdesc="https://git.sailfishos.org/mer-core/scratchbox2"
arch=('x86_64' 'i686')
url="https://git.sailfishos.org/mer-core/scratchbox2"
license=('GPL')
depends=('perl' 'lib32-glibc' 'sh')
# groups=()
# depends=()
source=(upstream::git+https://git.sailfishos.org/Thaodan/scratchbox2#branch=fix_ld_pie_error)
makedepends=(
  'git'
)


pkgver() {
  cd "$srcdir/upstream"
  printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
        cd upstream/$pkgname
        ./autogen.sh
        ./configure --prefix=/usr
        make
}

package() {
        cd upstream/$pkgname
        make prefix="$pkgdir/usr" install

        ln -s obs-rpm-build $pkgdir/usr/share/$pkgname/modes/sdk-build
        ln -s obs-rpm-build+pp $pkgdir/usr/share/$pkgname/modes/sdk-build+pp
        ln -s obs-rpm-install $pkgdir/usr/share/$pkgname/modes/sdk-install
}
md5sums=('SKIP')
