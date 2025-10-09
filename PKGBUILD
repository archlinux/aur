# Maintainer: Firstpick firstpick1992@proton.me
pkgname=pacsea-bin
pkgver=0.3.0
_tag="v$pkgver"
pkgrel=2
pkgdesc="Fast TUI for searching, inspecting, and queueing pacman/AUR packages written in Rust (binary version)"
arch=('x86_64')
url="https://github.com/Firstp1ck/Pacsea"
license=('MIT')
depends=('pacman' 'curl')
optdepends=('paru: for AUR package installation'
            'yay: alternative AUR helper')
provides=('pacsea')
conflicts=('pacsea' 'pacsea-git')
source=("Pacsea::https://github.com/Firstp1ck/Pacsea/releases/download/${_tag}/Pacsea"
        "Pacsea-${_tag}.tar.gz::https://github.com/Firstp1ck/Pacsea/archive/refs/tags/${_tag}.tar.gz")
sha256sums=('e591076b2911dbdcb019ad6ed9bdfe85659453df2c10b0481589e540e36d8ad8'
            'd36c31da9d6a505957bef3de294c34b88a98679da814b2260d31cd21cf191aba')

package() {
  : "${pkgdir:?pkgdir is not set}"
  : "${srcdir:?srcdir is not set}"

  # Install binary (release asset is named 'Pacsea'; install as lowercase 'pacsea')
  install -Dm755 "$srcdir/Pacsea" "$pkgdir/usr/bin/pacsea"

  # Install license and documentation from tagged source tarball
  install -Dm644 "$srcdir"/Pacsea-*/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir"/Pacsea-*/README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

