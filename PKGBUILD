# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=python-osh-git
pkgver=r7.4a11fae
pkgrel=1
pkgdesc="Ollama Shell Helper: English to Unix-like shell commands translation using local LLMs with Ollama"
arch=('any')
url="https://github.com/charyan/osh"
license=('MIT')
depends=('python' 'python-requests')
optdepends=('ollama: local model server that osh talks to')
makedepends=('git')
provides=('python-osh')
conflicts=('python-osh')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "osh"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
	cd osh
	install -Dm644 osh.py "$pkgdir/usr/lib/osh/osh.py"
	install -Dm755 /dev/stdin "$pkgdir/usr/bin/osh" <<'LAUNCHER'
#!/bin/sh
exec python3 /usr/lib/osh/osh.py "$@"
LAUNCHER

	install -Dm644 README.md "$pkgdir/usr/share/doc/osh/README.md"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
