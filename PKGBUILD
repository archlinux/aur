# Maintainer: Adrian Lopez <zeioth@hotmail.com>
pkgname=chatgpt-shell-cli-git
pkgver=1.0.r3.91f1b13
pkgrel=3
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
 # Install
 install -Dm755 "${srcdir}/chatGPT-shell-cli/chatgpt.sh" "${pkgdir}/usr/local/bin/chatgpt"

 # Replace open image command with xdg-open for linux systems
 if [[ "$OSTYPE" == "linux-gnu"* ]] || [[ "$OSTYPE" == "freebsd"* ]]; then
   sudo sed -i 's/open "\${image_url}"/xdg-open "\${image_url}"/g' '/usr/local/bin/chatgpt'
 fi
}
