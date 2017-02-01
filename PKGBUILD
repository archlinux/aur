# Maintainer: archlinux.info:tdy

pkgname=circos-docs
pkgver=0.67
pkgrel=1
pkgdesc="Circos tutorials"
arch=(any)
url=http://circos.ca
license=(GPL)
options=(docs)
source=(http://circos.ca/distribution/${pkgname%-*}-tutorials-$pkgver.tgz)
noextract=(${pkgname%-*}-tutorials-$pkgver.tgz)
sha256sums=(3ac7baa47fcbb73222f0045522e234c35b6788bfb9e99d8be96d76f53c51b2c7)

package() {
  # install
  bsdtar -xf ${pkgname%-*}-tutorials-$pkgver.tgz -C "$pkgdir" \
    -s ":^${pkgname%-*}-tutorials-$pkgver:usr/share/doc/${pkgname%-*}:"

  # sanitize
  find "$pkgdir" -exec sh -c \
    "file '{}' | grep -qE 'ELF|executable|directory' && chmod 755 '{}' || chmod 644 '{}'" \;
  chown -R root:root "$pkgdir"
  sed -i '1c\#!/usr/bin/env perl' "$pkgdir"/usr/share/doc/${pkgname%-*}/tutorials/8/11/addidtolinks
}
