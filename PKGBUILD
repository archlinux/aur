# Maintainer: yuzujr <15568103056@163.com>

pkgname=ani2xcursor-bin
_pkgname=ani2xcursor
pkgver=1.4.3
pkgrel=1
pkgdesc="Convert Windows animated cursor themes to Linux Xcursor format (prebuilt binary)"
arch=('x86_64')
url="https://github.com/yuzujr/ani2xcursor"
license=('MIT')
depends=('glibc')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("${_pkgname}-v${pkgver}-linux-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-x86_64.tar.gz")
sha256sums=('a4b7f296ff53cae6855b0fc847fe8a28fd43e9ac7328d0a814b094877a671b90')

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

  # Install compiled translations
  for mo in share/locale/*/LC_MESSAGES/ani2xcursor.mo; do
    lang=$(echo "$mo" | cut -d/ -f3)
    install -Dm644 "$mo" \
      "${pkgdir}/usr/share/locale/${lang}/LC_MESSAGES/ani2xcursor.mo"
  done
}
