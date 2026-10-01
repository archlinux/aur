# Maintainer: eggfriedrice <eggfriedricew.g.o@gmail.com>

# Prebuilt x86_64 release binary from upstream's GitHub releases, built on the
# GitHub ubuntu-latest runner. It links only libc.so.6 and libgcc_s.so.1 (no
# RPATH); any current Arch glibc satisfies it. The frameit package builds the
# same version from source.
pkgname=frameit-bin
pkgver=0.2.0
pkgrel=1
pkgdesc='Temporary selection rectangle overlay for Wayland and Hyprland screen shares'
arch=('x86_64')
url='https://github.com/eggfriedrice24/frameit'
license=('MIT')
depends=('glibc' 'libgcc')
optdepends=('hyprland: register the trigger with frameit bind')
provides=("${pkgname%-bin}=$pkgver")
conflicts=("${pkgname%-bin}")
# The upstream binary carries no debug info, so a -debug split would be empty.
options=('!debug')
_dist="${pkgname%-bin}-$pkgver-$CARCH-linux"
source_x86_64=("$url/releases/download/v$pkgver/$_dist.tar.gz")
# Value published by upstream in $_dist.tar.gz.sha256 next to the tarball.
sha256sums_x86_64=('6ea14b1d6c3941ef18588ed22ac9cce8ee1297d06dd69497fc5662e0808d2ab8')

package() {
  cd "$_dist"
  install -Dm0755 -t "$pkgdir/usr/bin/" "${pkgname%-bin}"
  install -Dm0644 -t "$pkgdir/usr/share/man/man1/" "doc/${pkgname%-bin}.1"
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/examples/" examples/config.toml
}
