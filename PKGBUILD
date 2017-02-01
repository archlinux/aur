# Maintainer: archlinux.info:tdy

pkgname=circos-tools
pkgver=0.22
pkgrel=1
pkgdesc="Circos addon scripts for common data reduction and analysis tasks"
arch=(any)
url=http://circos.ca
license=(GPL)
depends=(circos)
source=(http://circos.ca/distribution/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)
sha256sums=(d0709b08229803d6da58d8761fa86f5a091c32f3fe43dd22f6fadabf4e638b83)

package() {
  # install
  bsdtar -xf $pkgname-$pkgver.tgz -C "$pkgdir" \
    -s ":^$pkgname-$pkgver:opt/${pkgname%-*}:" $pkgname-$pkgver/tools
  bsdtar -xf $pkgname-$pkgver.tgz -C "$pkgdir" \
    -s ":^$pkgname-$pkgver:usr/share/doc/${pkgname%-*}:" $pkgname-$pkgver/README.tools

  # sanitize
  find "$pkgdir" -exec sh -c \
    "file '{}' | grep -qE 'ELF|executable|directory' && chmod 755 '{}' || chmod 644 '{}'" \;
  chown -R root:root "$pkgdir"
}
