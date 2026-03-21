# Maintainer: yuzujr <15568103056@163.com>

pkgname=ani2xcursor-bin
_pkgname=ani2xcursor
pkgver=1.4.7
pkgrel=1
pkgdesc="Convert Windows animated cursor themes to Linux Xcursor format (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/yuzujr/ani2xcursor"
license=('MIT')
depends=('glibc')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("${_pkgname}-v${pkgver}-linux-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-x86_64.tar.gz")
sha256sums_x86_64=('e0ed69379ff520d55c5c1e7947210b4d840b965ea3e730455df8bb16adf8b68e')
source_aarch64=("${_pkgname}-v${pkgver}-linux-arm64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-arm64.tar.gz")
sha256sums_aarch64=('8f4ebfd0d807f3f0b4b72c44e6fe5403c85d92533bd0e2d54d29f14a88d12960')

package() {
  cd "$srcdir"

  install -Dm755 ani2xcursor \
    "${pkgdir}/usr/bin/ani2xcursor"

  install -Dm644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 README.md \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 completions/fish/ani2xcursor.fish \
    "$pkgdir/usr/share/fish/vendor_completions.d/ani2xcursor.fish"

  install -Dm644 completions/bash/ani2xcursor \
    "$pkgdir/usr/share/bash-completion/completions/ani2xcursor"

  install -Dm644 completions/zsh/_ani2xcursor \
    "$pkgdir/usr/share/zsh/site-functions/_ani2xcursor"

  for mo in share/locale/*/LC_MESSAGES/ani2xcursor.mo; do
    lang=$(echo "$mo" | cut -d/ -f3)
    install -Dm644 "$mo" \
      "${pkgdir}/usr/share/locale/${lang}/LC_MESSAGES/ani2xcursor.mo"
  done
}
