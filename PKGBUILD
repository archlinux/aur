# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=chat.sh-git
pkgver=r17.1309f40
pkgrel=1
pkgdesc="Pipeable LLM wrapper with code execution (OpenRouter)"
arch=('any')
url="https://github.com/basherbots/chat.sh"
license=('CC0-1.0')
depends=('bash' 'curl' 'jq')
makedepends=('git')
provides=('chat.sh')
conflicts=('chat.sh')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "chat.sh"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	cd "chat.sh"
	sed -i -e 's|^CONFIG_FILE=.*|CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/chat.sh"\nmkdir -p "$CONFIG_DIR"\nCONFIG_FILE="$CONFIG_DIR/chat.config"|' -e 's|^HISTORY_FILE=.*|HISTORY_FILE="$CONFIG_DIR/chat.history"|' -e 's|^LOG_FILE=.*|LOG_FILE="$CONFIG_DIR/chat.logs"|' chat
}

package() {
	cd "chat.sh"
	install -Dm755 chat "$pkgdir/usr/bin/chat.sh"
	install -Dm644 README.md "$pkgdir/usr/share/doc/chat.sh/README.md"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
