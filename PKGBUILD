# Maintainer: nahdd123 <nahdd123@gmail.com>
pkgname=rhwp_bin
pkgver=0.9.0
pkgrel=1
pkgdesc='HWP/HWPX viewer and editor CLI (Rust/WASM, prebuilt binary)'
arch=('x86_64')
url='https://github.com/edwardkim/rhwp'
license=('MIT')
depends=('gcc-libs' 'fontconfig' 'freetype2')
provides=('rhwp')
conflicts=('rhwp')
options=('!strip' '!debug')
source=("https://github.com/edwardkim/rhwp/releases/download/v0.9.0/rhwp-v0.9.0-linux-x86_64.tar.gz"
        "https://raw.githubusercontent.com/edwardkim/rhwp/v0.9.0/LICENSE"
)
sha512sums=('198cd7a4101b5d7c1d093abb338f538072a51d46e17b6f3bbc83bfaa16377ef7808c21ad30fb7d3946761dd8a4cde46b10b02ebb925a7bcb7a1badc237635210'
            '8887f2d117a8cec00bee39b8b2d4c238f29323b4653b5e38396778a1510067e5697342ce819e765bfdffc626bc483178e4bfa067421a6bbb0711303d264c39bc'
)

package() {
  cd "${srcdir}/rhwp"

  install -Dm755 rhwp "${pkgdir}/usr/bin/rhwp"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  for f in README.md README_EN.md PDF_QUICKSTART.md PDF_QUICKSTART_EN.md; do
    if [[ -f $f ]]; then
      install -Dm644 "$f" "${pkgdir}/usr/share/doc/${pkgname}/${f}"
    fi
  done

  if [[ -d notices ]]; then
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}/notices"
    cp -a notices/. "${pkgdir}/usr/share/licenses/${pkgname}/notices/"
  fi
}
