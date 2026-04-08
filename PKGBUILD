# Maintainer: Starry Wang <starry.wang@suse.com>
pkgname=hangar-bin
pkgver=1.9.4
pkgrel=2
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
    "74abf51c2c39d8ab8cd61ad1348201fd5097534969850fe0dc2844061f1620bb"
)
source_aarch64=(
    "https://github.com/cnrancher/hangar/releases/download/v${pkgver}/hangar_Linux_arm64.tar.gz"
)
sha256sums_aarch64=(
    "17c936996854a14265a0a2ca174f0f0e48c73fd09dba2b9b3bcfc4ed443ea87d"
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
    install -Dm755 hangar ${pkgdir}/usr/bin/hangar
    # Completions
	install -Dm644 dist/completions/bash/hangar ${pkgdir}/usr/share/bash-completion/completions/hangar
	install -Dm644 dist/completions/zsh/_hangar ${pkgdir}/usr/share/zsh/site-functions/_hangar
	install -Dm644 dist/completions/fish/hangar.fish ${pkgdir}/usr/share/fish/vendor_completions.d/hangar.fish
    # LICENSE
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
