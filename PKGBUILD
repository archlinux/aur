# Maintainer: Grant G <grant@fig.io>
pkgname='fig-beta'
pkgver='2.0.0_alpha.12'
pkgrel=1
pkgdesc='Fig adds IDE-style autocomplete to your existing terminal.'
arch=('x86_64')
url='https://fig.io'
license=('custom')
depends=('gtk3' 'webkit2gtk' 'libappindicator-gtk3' 'ibus')
provides=('fig' 'fig_desktop' 'figterm' 'fig_ibus_engine')
conflicts=('fig')
source=("https://get-fig-io.s3.us-west-1.amazonaws.com/desktop/linux-x86_64/fig-${pkgver//_/-}.tar.gz")

sha256sums=('bd194dd5bfa84a05bf7bd38cbeb3e7729b63f669ec40bd18176860e8d4334107')

package() {
  find "${srcdir}/usr" -type f | sed "s|${srcdir}/||" | xargs -I{} install -Dm644 "${srcdir}/{}" "${pkgdir}/{}"
  chmod +x "${pkgdir}/usr/bin/"*

  # Figterm name copies
  for shell in 'zsh' 'bash' 'fish'; do
    install -Dm755 "${srcdir}/usr/bin/figterm" "${pkgdir}/usr/bin/${shell} (figterm)"
  done
}

