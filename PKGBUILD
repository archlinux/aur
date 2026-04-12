# Maintainer: Masaki Komagata <komagata@gmail.com>
pkgname=ai-quota-waybar-git
_pkgname=ai-quota-waybar
pkgver=r1.5ed5cb1
pkgrel=1
pkgdesc="Waybar custom module showing AI CLI tool (Claude Code / Codex / Gemini) quota usage"
arch=('any')
url="https://github.com/komagata/ai-quota-waybar"
license=('MIT')
depends=('bash' 'jq' 'curl' 'waybar')
optdepends=(
  'claude-code: Claude Code quota tracking'
  'codex: Codex CLI quota tracking'
  'gemini-cli-git: Gemini CLI quota tracking'
)
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_pkgname"
  install -Dm755 ai-quota-waybar.sh "$pkgdir/usr/bin/${_pkgname}"
  install -Dm644 config.example.sh "$pkgdir/usr/share/doc/${_pkgname}/config.example.sh"
  install -Dm644 waybar-config.example.jsonc "$pkgdir/usr/share/doc/${_pkgname}/waybar-config.example.jsonc"
  install -Dm644 waybar-style.example.css "$pkgdir/usr/share/doc/${_pkgname}/waybar-style.example.css"
  install -Dm644 README.md "$pkgdir/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
}
