# Maintainer: gardenapple <mailbox@appl.garden>
#
# Yes, I know, this package is very cursed. Once packwiz starts actually
# tagging releases, I will make a proper packwiz-bin package.

pkgname=packwiz-bin-git
pkgver=r309.ac6a590
pkgrel=1
pkgdesc='A CLI tool for creating Minecraft modpacks (pulls latest build artifact from GitHub)'
arch=('x86_64' 'aarch64')
url='https://packwiz.infra.link/'
license=('MIT')
source=("packwiz.git_(only_used_for_pkgver)::git+https://github.com/packwiz/packwiz")
source_x86_64=("packwiz-x86_64-$pkgver.zip::https://nightly.link/packwiz/packwiz/workflows/go/main/Linux%2064-bit%20x86.zip")
source_aarch64=("packwiz-aarch64-$pkgver.zip::https://nightly.link/packwiz/packwiz/workflows/go/main/Linux%2064-bit%20ARM.zip")
provides=('packwiz')
conflicts=('packwiz')
makedepends=('git')
sha256sums=('SKIP')
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

pkgver() {
	cd packwiz.git*/
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
	install -Dm755 packwiz -t "$pkgdir/usr/bin"
	chmod +x packwiz
	./packwiz completion bash | install -Dm644 /dev/stdin ${pkgdir}/usr/share/bash-completion/completions/packwiz
	./packwiz completion zsh | install -Dm644 /dev/stdin ${pkgdir}/usr/share/zsh/site-functions/_packwiz
	./packwiz completion fish | install -Dm644 /dev/stdin ${pkgdir}/usr/share/fish/vendor_completions.d/packwiz.fish
}
