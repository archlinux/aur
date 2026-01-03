# Maintainer: CassandraGargoyle <cassandragargoyle@gmail.com>
pkgname=portunix
pkgver=1.9.1
pkgrel=1
pkgdesc='Portunix CLI – intelligent developer environment automation toolkit'
arch=('x86_64')
url='https://github.com/cassandragargoyle/Portunix'
license=('MIT')
depends=()
makedepends=('go' 'git')
provides=('portunix')
conflicts=('portunix-bin')
source=("portunix-${pkgver}.tar.gz::https://github.com/cassandragargoyle/Portunix/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "portunix-${pkgver}"

  # Build using the project's build script
  chmod +x build-with-version.sh
  ./build-with-version.sh "v${pkgver}"
}

package() {
  cd "portunix-${pkgver}"

  # Install main binary
  install -Dm755 "portunix" "$pkgdir/usr/bin/portunix"

  # Install helper binaries
  install -Dm755 "ptx-container" "$pkgdir/usr/bin/ptx-container"
  install -Dm755 "ptx-mcp" "$pkgdir/usr/bin/ptx-mcp"
  install -Dm755 "ptx-virt" "$pkgdir/usr/bin/ptx-virt"
  install -Dm755 "ptx-ansible" "$pkgdir/usr/bin/ptx-ansible"
  install -Dm755 "ptx-prompting" "$pkgdir/usr/bin/ptx-prompting"
  install -Dm755 "ptx-python" "$pkgdir/usr/bin/ptx-python"
  install -Dm755 "ptx-installer" "$pkgdir/usr/bin/ptx-installer"
  install -Dm755 "ptx-aiops" "$pkgdir/usr/bin/ptx-aiops"
  install -Dm755 "ptx-make" "$pkgdir/usr/bin/ptx-make"
  install -Dm755 "ptx-pft" "$pkgdir/usr/bin/ptx-pft"

  # Install shell completions
  $pkgdir/usr/bin/portunix completion bash > portunix.bash
  $pkgdir/usr/bin/portunix completion zsh > _portunix
  $pkgdir/usr/bin/portunix completion fish > portunix.fish

  install -Dm644 "portunix.bash" "$pkgdir/usr/share/bash-completion/completions/portunix"
  install -Dm644 "_portunix" "$pkgdir/usr/share/zsh/site-functions/_portunix"
  install -Dm644 "portunix.fish" "$pkgdir/usr/share/fish/vendor_completions.d/portunix.fish"

  # Install documentation
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/portunix/README.md"

  # Install license
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/portunix/LICENSE"
}

