# Maintainer: Xeonacid <h.dwwwwww at gmail dot com>

pkgname=devtools-riscv64
pkgver=1.0.1
pkgrel=1
pkgdesc='Tools for Arch Linux RISC-V package maintainers'
arch=('x86_64' 'riscv64')
license=('GPL')
url='https://github.com/felixonmars/archriscv-packages'
depends=('devtools')
depends_x86_64=('qemu-user-static' 'binfmt-qemu-static')
source=(makepkg-riscv64.conf
        pacman-extra-riscv64.conf)
sha256sums=('c8842d83460d44b873ff56c9ee0c982963ff76e5ed13897e5d7b8d7f0ea7c206'
            'fc933f164d21774e7a1435d9fccf87cb05f7b601e89a2ba54b899b2ce1e809df')

package() {
  install -dm755 "$pkgdir"/usr/bin
  ln -s /usr/bin/archbuild "$pkgdir"/usr/bin/extra-riscv64-build

  install -Dm644 makepkg-riscv64.conf pacman-extra-riscv64.conf -t "$pkgdir"/usr/share/devtools/

  if [[ ! "$CARCH" =~ riscv ]]; then
    install -dm755 "$pkgdir"/usr/share/devtools/setarch-aliases.d
    echo "$CARCH" > "$pkgdir"/usr/share/devtools/setarch-aliases.d/riscv64
  fi
}

# vim: ts=2 sw=2 et:
