# Maintainer: Miguel Scaramozzino <mikele@gmail.com>

pkgname=leenky-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Leenky, a desktop clipboard URL collector for Linux"
arch=('x86_64')
url="https://github.com/mikelexp/Leenky"
license=('custom')
depends=('glibc' 'gcc-libs' 'gtk3')
source=("${url}/releases/download/v${pkgver}/leenky-${pkgver}-linux-x86_64.tar.gz")
sha256sums=('c5711d519c3dc4e77efb909ac7221cfc0e779ae18adae83961464b566bda7cbd')

package() {
  cd "${srcdir}"
  install -d "${pkgdir}/usr/lib/leenky"
  cp -a leenky/. "${pkgdir}/usr/lib/leenky/"
  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/leenky" <<'EOF'
#!/usr/bin/env sh
exec /usr/lib/leenky/leenky "$@"
EOF
  install -Dm644 leenky.desktop "${pkgdir}/usr/share/applications/leenky.desktop"
  install -Dm644 leenky.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/leenky.png"
}
