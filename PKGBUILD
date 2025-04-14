# Maintainer: Starry Wang <starry.wang@suse.com>
pkgname=hangar-bin
pkgver=1.9.2
pkgrel=1
epoch=
pkgdesc="Command line utility for container images"
arch=("x86_64" "aarch64")
url="https://github.com/cnrancher/hangar"
license=("Apache-2.0")
conflicts=(
    "hangar"
    "hangar-git"
    "hangar-debug"
    "hangar-git-debug"
)
depends=()
makedepends=(
    "gzip"
    "tar"
)
provides=()
source_x86_64=(
    "https://github.com/cnrancher/hangar/releases/download/v${pkgver}/hangar_Linux_x86_64.tar.gz"
)
sha256sums_x86_64=(
    "06480fd2800d27e4c7fba1115b1d236061e68b3aa043e87504518679ef48c770"
)
source_aarch64=(
    "https://github.com/cnrancher/hangar/releases/download/v${pkgver}/hangar_Linux_arm64.tar.gz"
)
sha256sums_aarch64=(
    "09b41861fe9f043b91516e3cdd4f428357e1962c4ccecd57fd7620f377e3ef4c"
)

build() {
    cd ${srcdir}/hangar_Linux*/
    install -dm755 ./dist/completions/{bash,zsh,fish}
	./hangar completion bash >| ./dist/completions/bash/hangar
	./hangar completion zsh >| ./dist/completions/zsh/_hangar
	./hangar completion fish >| ./dist/completions/fish/hangar.fish
}

package() {
    cd ${srcdir}/hangar_Linux*/
    # Binary
    install -Dm755 hangar ${pkgdir}/usr/local/bin/hangar
    # Completions
	install -Dm644 dist/completions/bash/hangar ${pkgdir}/usr/share/bash-completion/completions/hangar
	install -Dm644 dist/completions/zsh/_hangar ${pkgdir}/usr/share/zsh/site-functions/_hangar
	install -Dm644 dist/completions/fish/hangar.fish ${pkgdir}/usr/share/fish/vendor_completions.d/hangar.fish
    # LICENSE
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
