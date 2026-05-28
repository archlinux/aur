# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=deepclaude-git
pkgver=r15.70518b6
pkgrel=1
pkgdesc='Use Claude Code with DeepSeek, OpenRouter, or any Anthropic-compatible backend'
arch=('any')
url='https://github.com/aattaran/deepclaude'
license=('MIT')
depends=('claude-code' 'nodejs')
makedepends=('git')
provides=('deepclaude')
conflicts=('deepclaude')
source=("${pkgname}::git+https://github.com/aattaran/deepclaude.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$pkgname"
    sed -i 's|^SCRIPT_DIR=.*|SCRIPT_DIR="/usr/lib/deepclaude"|' deepclaude.sh
}

package() {
    cd "$pkgname"
    install -Dm755 deepclaude.sh "$pkgdir/usr/bin/deepclaude"
    install -Dm644 proxy/start-proxy.js "$pkgdir/usr/lib/deepclaude/proxy/start-proxy.js"
    install -Dm644 proxy/model-proxy.js "$pkgdir/usr/lib/deepclaude/proxy/model-proxy.js"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
