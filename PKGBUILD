# Maintainer: Adrian Lopez <zeioth@hotmail.com>
pkgname=chatgpt-shell-cli
pkgver=0.1
pkgrel=3
pkgdesc="Use OpenAI's ChatGPT and DALL-E from the terminal."
arch=(any)
url="https://github.com/0xacx/chatGPT-shell-cli.git"
license=('MIT')
depends=(jq curl)
provides=(chatgpt-shell-cli)
conflicts=(chatgpt-shell-cli-git)
source=("git+$url#commit=e47853176d2cc36602ca04507fd3b5525f623737")
sha256sums=('SKIP')

package() {
 # Replace open image command with xdg-open for linux systems
 if [[ "$OSTYPE" == "linux-gnu"* ]] || [[ "$OSTYPE" == "freebsd"* ]]; then
   sed -i 's/open "\${image_url}"/xdg-open "\${image_url}"/g' "${srcdir}/chatGPT-shell-cli/chatgpt.sh" 
 fi

# Install
 install -Dm755 "${srcdir}/chatGPT-shell-cli/chatgpt.sh" "${pkgdir}/usr/local/bin/chatgpt"
}
