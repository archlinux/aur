# Maintainer: Ewout van Mansom <ewout@vanmansom.name>

pkgname=plymouth-theme-spinner-no-mark
pkgver=22.02.122
pkgrel=3
pkgdesc='Spinner Plymouth theme with watermark removed'
arch=('any')
url='https://gitlab.freedesktop.org/plymouth/plymouth'
license=('GPL2')
depends=('plymouth')
install='plymouth-theme-spinner-no-mark.install'
source=(
  "https://gitlab.freedesktop.org/plymouth/plymouth/-/archive/${pkgver}/plymouth-${pkgver}.tar.gz"
  'spinner-nomark.plymouth'
)
b2sums=('3a5153b48bf8afb865a577708e00b2b0d0164622e344bcd916c7333c30a5bcd7f07273cc417bac68763acb5f4a2a84d203e34969c5eb24308e9c1573a69b18e1'
        '7bbfbec683a4ef16e99200c62b659f643b5db9d042a2933ad35d00e34ef811da0caa051865e69ac83b9478e22111cb275e64fa847841a8d23560f5762be6b4b4')

package() {
  install -d "${pkgdir}/usr/share/plymouth/themes/spinner-nomark"

  for i in ${srcdir}/plymouth-${pkgver}/themes/spinner/*.png; do
    # skip watermark
    if [[ $i == "watermark.png"  ]]; then
      continue
    fi

    fn=$(basename $i)
    install -Dm 644 "${srcdir}/plymouth-${pkgver}/themes/spinner/${fn}" "${pkgdir}/usr/share/plymouth/themes/spinner-nomark/${fn}"
  done

  install -Dm 644 "${srcdir}/spinner-nomark.plymouth" "${pkgdir}/usr/share/plymouth/themes/spinner-nomark/spinner-nomark.plymouth"
}
