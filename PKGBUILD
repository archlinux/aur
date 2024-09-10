pkgname=cuda-versioned-common
pkgver=1
pkgrel=1
pkgdesc='Common files for versioned CUDA Toolkits'
arch=('any')
license=('GPL')
depends=('bash' 'findutils' 'coreutils')

# I can't have a conflict with 'cuda', as all the cudax.y-versioned packages provide it!
#conflicts=('cuda' 'cuda-tools')

source=(bin_archlinux-cuda
        cuda-versioned.conf
        cuda-versioned-common.install
        cuda-versioned.sh
        README)
sha256sums=('d10068ff5808faed21255306bc3fdc746f161211f52e35b0538df1264b55a8d2'
            'ee6d420fdf824172bb511fbdab5aefe8e9b862b2a1e92eed38094d1c1c343af6'
            '570a192c38eb6386155b51efc340428877e3b3705dc3590c27e02b4ae029a1b6'
            'ad61283a1c836005ee327523fb4f4c36015df3b885fd40728a7cb4fad15dc94c'
            'dac5843feefbc51eceadcf1666a916f39a1da7c634ea8f22e062f4963dfc89a4')

package() {
  install=cuda-versioned-common.install

  install -D -m 755 bin_archlinux-cuda "${pkgdir}/usr/bin/archlinux-cuda"
  install -D -m 755 "${srcdir}/cuda-versioned.sh" "${pkgdir}/etc/profile.d/cuda-versioned.sh"

  install -D -m 644 "${srcdir}/cuda-versioned.conf" "${pkgdir}/etc/ld.so.conf.d/cuda-versioned.conf"
  install -D -m 644 "${srcdir}/README" "${pkgdir}/opt/cuda/README"
}
