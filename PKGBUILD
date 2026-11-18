# Maintainer: nahdd123 <nahdd123@gmail.com>
pkgname=rhwp_bin
pkgver=0.9.1
pkgrel=1
pkgdesc='HWP/HWPX viewer and editor CLI (Rust/WASM, prebuilt binary)'
arch=('x86_64')
url='https://github.com/edwardkim/rhwp'
license=('MIT')
depends=('gcc-libs' 'fontconfig' 'freetype2')
provides=('rhwp')
conflicts=('rhwp')
options=('!strip' '!debug')
source=("https://github.com/edwardkim/rhwp/releases/download/v0.9.1/rhwp-v0.9.1-linux-x86_64.tar.gz"
        "https://raw.githubusercontent.com/edwardkim/rhwp/v0.9.1/LICENSE"
)
sha512sums=('888501c8b36392a5308b8cbbde5b535eb10b6b0ebfd14da5bd5aaa8a2ffb4763a38e2fff33343a8584ef733742c354773f220f85b498faff0914c300a4c7ea3a'
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
