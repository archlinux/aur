# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=abcpp
pkgver=1.4.6
pkgrel=4
pkgdesc='A preprocessor designed for, but not limited to, ABC music files'
url='https://abcplus.sourceforge.net/#abcpp'
license=(GPL2)
arch=(aarch64 x86_64)
depends=(glibc)
groups=(abc pro-audio)
source=("https://sourceforge.net/projects/abcplus/files/$pkgname/$pkgname-$pkgver.tar.gz"
        'abcpp-makefile-cflags.patch')
sha256sums=('05a9a7f81b35aff8f1b03ad0c41539508812ec1e52d2f584a180d3c12e35edc1'
            '3e57b254946fe9b9b8d07e41f87fd445b0480ffa2c8461ea758de2901a9b67af')

prepare() {
  cd $pkgname-$pkgver
  patch -p1 -N -r - -i "$srcdir"/abcpp-makefile-cflags.patch
}

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  # program
  install -Dm755 abcpp -t "$pkgdir"/usr/bin
  # abc include files
  install -Dm644 *.abp -t "$pkgdir"/usr/share/$pkgname
  # documentation & examples
  install -Dm644 docs/* -t "$pkgdir"/usr/share/doc/$pkgname
  install -Dm644 examples/* -t "$pkgdir"/usr/share/doc/$pkgname/examples
}
