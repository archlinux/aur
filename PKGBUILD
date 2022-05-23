# Maintainer: Grant G <grant@fig.io>
pkgname='fig-beta'
pkgver='2.0.0_alpha.6'
pkgrel=1
pkgdesc='Fig adds IDE-style autocomplete to your existing terminal.'
arch=('x86_64')
url='https://fig.io'
license=('custom')
depends=('gtk3' 'webkit2gtk' 'libappindicator-gtk3' 'ibus')
provides=('fig' 'fig_desktop' 'figterm' 'fig_ibus_engine')
conflicts=('fig')
source=("https://get-fig-io.s3.us-west-1.amazonaws.com/desktop/linux-x86_64/fig-${pkgver//_/-}.tar.gz")

sha256sums=('9f9b7a488288f6c27ffe53fed93e2e38e55319d0aa29cb6abc24940b6e2dde17')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  for bin in 'fig' 'fig_desktop' 'figterm' 'fig_ibus_engine'; do
    install -Dm755 "${srcdir}/usr/bin/${bin}" "${pkgdir}/opt/fig/bin/${bin}"
    ln -sf "/opt/fig/bin/${bin}" "${pkgdir}/usr/bin/${bin}"
  done

  # Figterm name copies
  for shell in 'zsh' 'bash' 'fish'; do
    install -Dm755 "${srcdir}/usr/bin/figterm" "${pkgdir}/opt/fig/bin/${shell} (figterm)"
    ln -sf "/opt/fig/bin/${shell} (figterm)" "${pkgdir}/usr/bin/${shell} (figterm)"
  done

  install -Dm644 "${srcdir}/usr/share/applications/fig.desktop" "${pkgdir}/usr/share/applications/fig.desktop"
  install -Dm644 "${srcdir}/usr/share/ibus/component/engine.xml" "${pkgdir}/usr/share/ibus/component/engine.xml"

  for size in 32 128 256 512; do
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/${size}x${size}/apps/fig.png" \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/fig.png"
  done

  install -Dm644 "${srcdir}/usr/share/pixmaps/fig.png" "${pkgdir}/usr/share/pixmaps/fig.png"
}

