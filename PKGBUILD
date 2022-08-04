# Maintainer: gardenapple <gardenapple at posteo.net>

pkgname=packwiz-bin-git
pkgver=r226.3f0ebeb
pkgrel=1
pkgdesc='A CLI tool for creating Minecraft modpacks (pulls latest build artifact from GitHub)'
arch=('x86_64' 'aarch64')
url='https://packwiz.infra.link/'
license=('MIT')
source_x86_64=("packwiz-x86_64-$pkgver.zip::https://nightly.link/packwiz/packwiz/workflows/go/master/Linux%2064-bit%20x86.zip")
source_aarch64=("packwiz-aarch64-$pkgver.zip::https://nightly.link/packwiz/packwiz/workflows/go/master/Linux%2064-bit%20ARM.zip")
provides=('packwiz')
conflicts=('packwiz')
makedepends=('curl' 'git' 'htmlq')
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

pkgver() {
	commit_count="$(curl 'https://github.com/packwiz/packwiz/' | htmlq --text '.d-sm-inline strong')"
	commit_hash="$(git ls-remote --heads 'https://github.com/packwiz/packwiz/' | head -n1 | cut -c1-7)"
	printf 'r%s.%s' "$commit_count" "$commit_hash"
}

package() {
	install -Dm755 packwiz -t "$pkgdir/usr/bin"
	chmod +x packwiz
	./packwiz completion bash | install -Dm644 /dev/stdin ${pkgdir}/usr/share/bash-completion/completions/packwiz
	./packwiz completion zsh | install -Dm644 /dev/stdin ${pkgdir}/usr/share/zsh/site-functions/_packwiz
	./packwiz completion fish | install -Dm644 /dev/stdin ${pkgdir}/usr/share/fish/vendor_completions.d/packwiz.fish
}
