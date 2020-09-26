# Maintainer: Quinn Casey <quinn@quinncasey.com>
pkgname=boop-gtk
pkgver=v1.3.0
pkgrel=2
pkgdesc="Port of @IvanMathy's Boop to GTK, a scriptable scratchpad for developers."
arch=('any')
pkgdir=Boop-GTK
url=https://github.com/mrbenshef/Boop-GTK
source=(Boop-GTK::git+https://github.com/mrbenshef/Boop-GTK#branch=release)
license=('MIT')
depends=(
  gtksourceview3
  gtk3
)
makedepends=(
  'rust>=1.46.0'
  git
)

build() {
  cd Boop-GTK
  git submodule update --init --recursive
  cargo build --release --locked --all-features --target-dir=target
}

package() {
  install -Dm 755 "Boop-GTK/target/release/${pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm 644 "Boop-GTK/flatpak/data/uk.co.mrbenshef.Boop-GTK.png" -t "${pkgdir}/usr/share/pixmaps"
  install -Dm 644 "Boop-GTK/flatpak/data/uk.co.mrbenshef.Boop-GTK.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm644 Boop-GTK/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 Boop-GTK/README.md "$pkgdir/usr/share/doc/${pkgname}/README.md"
}

md5sums=('SKIP')