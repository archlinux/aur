# Maintainer: Björn <theodorstormgrade@gmail.com>
pkgname=scratchbox2
pkgver=2.3.90+git2.r76.fc3eefe
pkgrel=3
pkgdesc="https://git.sailfishos.org/mer-core/scratchbox2"
arch=('x86_64' 'i686')
url="https://git.sailfishos.org/mer-core/scratchbox2"
license=('GPL')
depends=('perl' 'lib32-glibc' 'sh')
optdepends=('qemu-arch-extra: arm and aarch64 support')
# groups=()
# depends=()
source=(upstream::git+https://git.sailfishos.org/Thaodan/scratchbox2#branch=fix_ld_pie_error)
makedepends=(
  'git'
  'lib32-gcc-libs'
)


pkgver() {
  cd "$srcdir/upstream"
  printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
        cd upstream/$pkgname
        ./autogen.sh
        ./configure --prefix=/usrg
        make
}

package() {
        cd upstream/$pkgname
        make prefix="$pkgdir/usr" install

        ln -s obs-rpm-build $pkgdir/usr/share/$pkgname/modes/sdk-build
        ln -s obs-rpm-build+pp $pkgdir/usr/share/$pkgname/modes/sdk-build+pp
        ln -s obs-rpm-install $pkgdir/usr/share/$pkgname/modes/sdk-install
        ln -s /usr/bin/qemu-arm $pkgdir/usr/bin/qemu-arm-dynamic
        ls -s /usr/bin/qemu-aarch64 $pkgdir/usr/bin/qemu-aarch64-dynamic
}
md5sums=('SKIP')
