# $Id$
# Maintainer: uberushaximus <uberushaximus@gmail.com>

pkgname=libretro-bsnes-mercury-git
pkgver=209
pkgrel=1
pkgdesc='Super Nintendo Entertainment System cores with various performance improvements'
arch=('i686' 'x86_64')
url='https://github.com/libretro/bsnes-mercury'
license=('GPL3')
groups=('libretro')
depends=('gcc-libs' 'glibc')
makedepends=('git')
source=('bsnes-mercury::git+https://github.com/libretro/bsnes-mercury'
        'https://raw.githubusercontent.com/libretro/libretro-super/master/dist/info/bsnes_mercury_accuracy_libretro.info'
        'https://raw.githubusercontent.com/libretro/libretro-super/master/dist/info/bsnes_mercury_balanced_libretro.info'
        'https://raw.githubusercontent.com/libretro/libretro-super/master/dist/info/bsnes_mercury_performance_libretro.info')
sha256sums=('SKIP'
            '9b9b7ab87e79fb9a6c5728bdbe63b9430c1e79af02600cf44fd2cc041e635d72'
            'dc5fb75a930e8486771343932761149b96cfdb14e44032c2b5218ecc27595d4f'
            '66a883d21a05f638ee7c345ff58e6eeb39305f7e6959081964786dfac6f3867a')

pkgver() {
  cd bsnes-mercury

  git rev-list --count HEAD
}

build() {
  cd bsnes-mercury

  for p in accuracy balanced performance; do
    make profile=${p}
  done
}

package() {
  cd bsnes-mercury

  install -dm 755 "${pkgdir}"/usr/{lib/libretro,share/libretro/info}
  for p in accuracy balanced performance; do
    install -m 644 out/bsnes_mercury_${p}_libretro.so "${pkgdir}"/usr/lib/libretro/
    install -m 644 ../bsnes_mercury_${p}_libretro.info "${pkgdir}"/usr/share/libretro/info/
  done
}

# vim: ts=2 sw=2 et:
