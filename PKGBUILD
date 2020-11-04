# Maintainer: Björn <theodorstormgrade@gmail.com>
pkgname=scratchbox2
pkgver=2.3.90+git29.r0.395a762
pkgrel=1
pkgdesc="https://git.sailfishos.org/mer-core/scratchbox2"
arch=('x86_64' 'i686')
url="https://git.sailfishos.org/mer-core/scratchbox2"
license=('GPL')
depends=('perl' 'lib32-glibc' 'sh')
optdepends=('qemu-arch-extra: arm and aarch64 support')
source=($pkgname::git+https://git.sailfishos.org/mer-core/scratchbox2#tag=2.3.90+git29)
md5sums=('SKIP')
makedepends=(
  'git'
  'lib32-gcc-libs'
)


pkgver() {
  cd "$srcdir/$pkgname"
  printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
        cd $pkgname/$pkgname
        ./autogen.sh
        ./configure --prefix=/usrg
        make
}

package() {
        cd $pkgname/$pkgname
        make prefix="$pkgdir/usr" install

        ln -s obs-rpm-build $pkgdir/usr/share/$pkgname/modes/sdk-build
        ln -s obs-rpm-build+pp $pkgdir/usr/share/$pkgname/modes/sdk-build+pp
        ln -s obs-rpm-install $pkgdir/usr/share/$pkgname/modes/sdk-install
        ln -s /usr/bin/qemu-arm $pkgdir/usr/bin/qemu-arm-dynamic
        ln -s /usr/bin/qemu-aarch64 $pkgdir/usr/bin/qemu-aarch64-dynamic
}
