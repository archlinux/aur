# Maintainer: Grant G <grant@fig.io>
pkgname='fig-beta'
pkgver='2.3.13'
pkgrel=1
pkgdesc='Fig adds IDE-style autocomplete to your existing terminal.'
arch=('x86_64')
url='https://fig.io'
license=('custom')
depends=('gtk3' 'webkit2gtk' 'libappindicator-gtk3' 'ibus' 'xdg-utils')
provides=('fig' 'fig_desktop' 'figterm' 'fig_ibus_engine')
conflicts=('fig')
source=("${pkgname}-${pkgver//_/-}.tgz::https://pkg.fig.io/download?kind=archlinux&platform=archlinux&version=${pkgver//_/-}&arch=${arch}")

sha256sums=('32721c5f317a927898721f5bd73442c90ca871d338eb220a0e0264f4689b756d')

package() {
  find "${srcdir}/usr" -type f | sed "s|${srcdir}/||" | xargs -I{} install -Dm644 "${srcdir}/{}" "${pkgdir}/{}"
  chmod +x "${pkgdir}/usr/bin/"*

  # Figterm name copies
  for shell in 'zsh' 'bash' 'fish'; do
    install -Dm755 "${srcdir}/usr/bin/figterm" "${pkgdir}/usr/bin/${shell} (figterm)"
  done
}

