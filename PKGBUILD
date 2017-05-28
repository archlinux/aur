# Maintainer: Ainola

pkgname=gtk-theme-united-gnome
pkgver=2.1.2
pkgrel=1
epoch=1
pkgdesc="GTK2/3 + GNOME Shell theme based on a Ubuntu 18.04 design concept."
arch=(any)
url="https://github.com/godlyranchdressing/United-GNOME"
license=('GPL3')
source=("United-Arch-$pkgver"::"https://github.com/godlyranchdressing/United-GNOME/releases/download/V$pkgver/United-Arch.tar.gz"
        "United-Fedora-$pkgver"::"https://github.com/godlyranchdressing/United-GNOME/releases/download/V$pkgver/United-Fedora.tar.gz"
        "United-Manjaro-$pkgver"::"https://github.com/godlyranchdressing/United-GNOME/releases/download/V$pkgver/United-Manjaro.tar.gz"
        "United-OpenSUSE-$pkgver"::"https://github.com/godlyranchdressing/United-GNOME/releases/download/V$pkgver/United-OpenSUSE.tar.gz"
        "United-Solus-$pkgver"::"https://github.com/godlyranchdressing/United-GNOME/releases/download/V$pkgver/United-Solus.tar.gz"
        "United-Ubuntu-$pkgver"::"https://github.com/godlyranchdressing/United-GNOME/releases/download/V$pkgver/United-Ubuntu-alt.tar.gz")
sha256sums=('86974a261b0b70f3c9a61d4f6a9f129ecc54d3fe7508e305e76e0bc3b947a1c7'
            '57fa9001e7baad299ed5c89e0859313f67b995805b1599365fe77dc904ca25f1'
            '29123008ed1d416df0496837013ffa5974b62a3596daebe6c6701ad9c01b7bf9'
            '9106cdab1120be1b4c57218f4a32cad9d34219a35d137db4d81f07847cc66c0a'
            'd58e3ed5610647ac812f5489a3edfe5ec805f45516b43dee6ab2a8e2ad4f9063'
            '97a828812df3f8470211bca03fe28d00fcccb1d85a7be4afbb58a9c4570504f1')

package() {
  install -dm755 "$pkgdir/usr/share/themes"
  # Upstream names tend to differ between releases: So that users don't have to
  # constantly re-apply their themes, let's just agree on the following format
  # in case it changes again: United-<distro><-variant> (e.g. United-Arch or
  # United-Arch-Darker)

  # Upstream started calling "United-Ubuntu" "United-Ubuntu-alt". If this
  # sticks for long enough then this manual renaming should be removed.
  for dir in "$srcdir"/United-Ubuntu-alt*; do
    mv "$dir" "${dir/-alt/}"
  done

  # Dirs in $srcdir are installable themes; however, we want to ignore symlinks
  find "$srcdir" -mindepth 1 -maxdepth 1 -type d -exec \
    cp -rt "$pkgdir/usr/share/themes/" {} +
  find "$pkgdir/usr/share/themes/" -type d -exec chmod 755 {} \;
  find "$pkgdir/usr/share/themes/" -type f -exec chmod 644 {} \;
}

# vim: ts=2 sw=2 et
