# Maintainer: Adrian Lopez <zeioth@hotmail.com>
# Contributors: malmerri
pkgname=chatgpt-shell-cli-git
_pkgname=chatGPT-shell-cli
pkgver=1.0.r161.ea41590
pkgrel=2
pkgdesc="Use OpenAI's ChatGPT and DALL-E from the terminal."
arch=(any)
url="https://github.com/0xacx/chatGPT-shell-cli.git"
license=('MIT')
depends=(jq curl glow)
makedepends=('git')
conflicts=(chatgpt-shell-cli)
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgname}"
  printf "1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  # Instead of using the provided install.sh, we just add this line for GNU Linux
  sed -i 's/open "\${image_url}"/xdg-open "\${image_url}"/g' "${srcdir}/chatGPT-shell-cli/chatgpt.sh"

  # Install
  install -Dm755 "${srcdir}/chatGPT-shell-cli/chatgpt.sh" "${pkgdir}/usr/bin/chatgpt"
  install -Dm644 "${srcdir}/chatGPT-shell-cli//LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
