pkgname=memtest86+-6-git
pkgver=v6.10.r12.g66bd82f
pkgrel=1
pkgdesc='Memtest86+ is a free, open-source, stand-alone memory tester for x86 and x86-64 architecture computers. It provides a much more thorough memory check than that provided by BIOS memory tests.'
arch=('x86_64')
url=https://github.com/memtest86plus/memtest86plus
license=('GPL2')
source=('git+https://github.com/memtest86plus/memtest86plus.git')
sha256sums=('SKIP')

pkgver() {
  cd "memtest86plus"
  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "memtest86plus"/build64
    make
    make iso
}

package() {
    cd "memtest86plus"/build64
    install -Dm644 memtest.bin "$pkgdir"/boot/memtest86plus-6/memtest.bin
    install -Dm644 memtest.efi "$pkgdir"/boot/memtest86plus-6/memtest.efi
    install -Dm644 memtest.iso "$pkgdir"/usr/share/memtest86plus-6/memtest.iso
}
