# Maintainer: GaelicThunder <kiuuby9234@gmail.com>
pkgname=pls-cli-git
pkgver=v0.1.0.0.gb21744f
pkgrel=1
pkgdesc="Natural language to shell commands using Ollama (git version)"
arch=('any')
url="https://github.com/GaelicThunder/pls"
license=('MIT')
depends=('bash' 'jq' 'curl')
optdepends=(
    'fish: for fish shell integration'
    'zsh: for zsh shell integration'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')


pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/\\([^-]*-g\\)/r\\1/;s/-/./g'
}


build() {
  cd "${pkgname%-git}"
}

package() {
  cd "${_pkgname}"

  install -Dm755 "bin/pls-engine" "${pkgdir}/usr/bin/pls-engine"

  install -Dm644 "shell-integrations/fish.fish" "${pkgdir}/usr/share/pls/integrations/fish.fish"
  install -Dm644 "shell-integrations/bash.sh" "${pkgdir}/usr/share/pls/integrations/bash.sh"
  install -Dm644 "shell-integrations/zsh.sh" "${pkgdir}/usr/share/pls/integrations/zsh.sh"

  echo "${pkgver}-${pkgrel}" > "${pkgdir}/usr/share/doc/${pkgname}/VERSION"

  install -Dm644 "config/config.json.example" "${pkgdir}/usr/share/doc/${pkgname}/config.json.example"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
