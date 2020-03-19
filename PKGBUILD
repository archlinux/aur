pkgname=f32c-tools
pkgver=0698352
pkgrel=1
pkgdesc="ULX2S / ULX3S FPGA JTAG programmer & tools (Lattice XP2 / ECP5)"
arch=('any')
url='https://github.com/f32c/tools'
license=('NONE')
depends=('python')
provides=("ujprog" "f32cup" "ft232r_flash")
source=("git+https://github.com/f32c/tools"
        "80-fpga-ulx3s.rules"
        "Makefile")
sha256sums=('SKIP'
            '8ca346c65ca04f8b06e6877180b2f1eed7b7dbd8ce3ee5ad2d80da7158175686'
            'df040cc999654bb8357a66df4bf4fb4d8335716b2a728a0edeecb7918be00a0a')
options=(!strip)

prepare() {
  cd "${srcdir}/tools/ujprog"
  rm -f Makefile
  ln -s ../../../Makefile Makefile
  make 
  make flash
}

package() {
  install -Dm755 "${srcdir}/tools/ujprog/ujprog" "${pkgdir}/usr/bin/ujprog"
  install -Dm755 "${srcdir}/tools/ujprog/ft232r_flash" "${pkgdir}/usr/bin/ft232r_flash"
  install -Dm755 "${srcdir}/tools/f32cup/f32cup.py" "${pkgdir}/usr/bin/f32cup"
  install -Dm644 "${srcdir}/tools/f32cup/f32cup.ino" "${pkgdir}/usr/share/f32c-tools/f32cup/example/f32cup.ino"
  install -Dm644 "80-fpga-ulx3s.rules" "${pkgdir}/usr/lib/udev/rules.d/80-fpga-ulx3s.rules"
}

# vim:set ts=2 sw=2 et:
