# Maintainer: Adrian Lopez <zeioth@hotmail.com>
pkgname=chatgpt-shell-cli-git
pkgver=1.0.r10.d094f67
pkgrel=2
pkgdesc="Use OpenAI's ChatGPT and DALL-E from the terminal."
arch=(any)
url="https://github.com/0xacx/chatGPT-shell-cli.git"
license=('MIT')
depends=(jq curl)
provides=(chatgpt-shell-cli-git)
conflicts=(chatgpt-shell-cli)
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  # Instead of using the provided install.sh, we just add this line for GNU Linux
  sed -i 's/open "\${image_url}"/xdg-open "\${image_url}"/g' "${srcdir}/chatGPT-shell-cli/chatgpt.sh" 

  # Install
  install -Dm755 "${srcdir}/chatGPT-shell-cli/chatgpt.sh" "${pkgdir}/usr/local/bin/chatgpt"
  install -Dm444 "${srcdir}/chatGPT-shell-cli//LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
