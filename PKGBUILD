# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=python-cli-co-pilot-git
pkgver=r146.f5aebe0
pkgrel=1
pkgdesc="CLI tool that uses GPT4 to turn natural language commands into Bash/ZShell/PowerShell equivalents"
arch=('any')
url="https://github.com/AntonOsika/CLI-Co-Pilot"
license=('MIT')
depends=('python' 'python-openai' 'python-psutil' 'bash')
makedepends=('git')
provides=('python-cli-co-pilot')
conflicts=('python-cli-co-pilot')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "CLI-Co-Pilot"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
	cd CLI-Co-Pilot
	local _root="$pkgdir/usr/share/cli-co-pilot"
	install -dm755 "$_root"
	cp -a src scripts contexts "$_root/"
	find "$_root" -type d -name '__pycache__' -prune -exec rm -rf {} +
	install -Dm644 README.md "$pkgdir/usr/share/doc/cli-co-pilot/README.md"
	install -Dm644 Installation.md "$pkgdir/usr/share/doc/cli-co-pilot/Installation.md"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
