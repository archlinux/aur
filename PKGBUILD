# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=lean4-bin
_pkgver=4.0.0-m5
pkgver=$(echo "$_pkgver" | sed  's/-/./')
pkgrel=1
pkgdesc="An interactive theorem prover"
arch=('x86_64' 'aarch64')
url="https://leanprover.github.io/"
license=('apache')
optdepends=('bash')
provides=("lean4=$pkgver")
conflicts=('lean4')
options=('staticlibs')
source=("LICENSE::https://raw.githubusercontent.com/leanprover/lean4/master/LICENSE")
source_x86_64=("https://github.com/leanprover/lean4/releases/download/v$_pkgver/lean-4.0.0-linux.tar.zst")
source_aarch64=("https://github.com/leanprover/lean4/releases/download/v$_pkgver/lean-4.0.0-linux_aarch64.tar.zst")
sha256sums=('SKIP')
sha256sums_x86_64=('9152b71abd61942567928b793c80c19cb0a59371baf748b870ed9e78bc8ae2d0')
sha256sums_aarch64=('a5a13c2aa9ce215970570027e7eccaddd755126c60a1f85b3905a932e5255483')


package() {
  cd "lean-4.0.0-linux"

  mkdir -p "$pkgdir/opt/lean4"
  mv * "$pkgdir/opt/lean4"

  mkdir -p "$pkgdir/usr/bin"
  ln -s "/opt/lean4/bin"/{lake,lean,leanc,leanmake,leanpkg} "$pkgdir/usr/bin"

  install -Dm644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/lean4"
}
