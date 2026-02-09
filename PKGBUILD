pkgname=lazy-llm-bin
pkgver=0.1.0
pkgrel=1
pkgdesc='Multi-LLM desktop interface built with Electron, Vue, and TypeScript.'
arch=('x86_64')
url='https://github.com/2725244134/lazy-llm'
license=('custom')
depends=('alsa-lib' 'at-spi2-core' 'gtk3' 'libnotify' 'libsecret' 'libxss' 'libxtst' 'nss' 'xdg-utils')
provides=('lazy-llm')
conflicts=('lazy-llm')
options=('!strip')
source_x86_64=("${pkgname}-${pkgver}-x86_64.deb::https://github.com/2725244134/lazy-llm/releases/download/v${pkgver}/lazy-llm_${pkgver}_amd64.deb")
sha256sums_x86_64=('30ed15dc36e6238514aba502d117249274f75258864cca679002289ff290af05')

package() {
  bsdtar -xf "${srcdir}/${pkgname}-${pkgver}-x86_64.deb" -C "${srcdir}"

  local data_archive
  data_archive="$(find "${srcdir}" -maxdepth 1 -type f -name 'data.tar.*' -print -quit)"
  [[ -n "${data_archive}" ]] || {
    echo 'data.tar archive not found in deb payload' >&2
    return 1
  }

  bsdtar -xf "${data_archive}" -C "${pkgdir}"
}
