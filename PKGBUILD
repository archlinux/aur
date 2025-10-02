# Maintainer: Firstpick firstpick1992@proton.me
pkgname=pacsea-bin
pkgver=0.2.0
_tag="v$pkgver"
pkgrel=1
pkgdesc="Fast TUI for searching, inspecting, and queueing pacman/AUR packages written in Rust"
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
sha256sums=('8a42f74b8f16aaf5aff3720f28187c8f70acddb766d100ad00457eb1f682360b'
            '287020c6417107d6ced49dcf58a6b83286b436c6a1a7168a298f60c101d64d98')

package() {
  : "${pkgdir:?pkgdir is not set}"
  : "${srcdir:?srcdir is not set}"

  # Install binary (release asset is named 'Pacsea'; install as lowercase 'pacsea')
  install -Dm755 "$srcdir/Pacsea" "$pkgdir/usr/bin/pacsea"

  # Install license and documentation from tagged source tarball
  install -Dm644 "$srcdir"/Pacsea-*/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir"/Pacsea-*/README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

