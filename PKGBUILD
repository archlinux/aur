# Maintainer: Ainola

pkgname=gtk-theme-united-gnome
pkgver=2.1.1
pkgrel=2
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
sha256sums=('1d9844059665efda1bb986980a627161f2d7616919fd8254288aff5a09137a1b'
            'f66808391ea125002611cde5d0e383909c97a051bd4dfd588255dbf4f63ce0d8'
            'ba5111949389bcc18a1a4c7019144315e2b9e4f055be5bdb04162f691d9c51c3'
            '25dfae62b34e8d01c7640b361f63d1e7202a6bca7b0672deafc8c6b06b435ee4'
            'd0ce7adc6a23f30748dfdae4a2b2c18c6cab9d334dd2a5b061f088dc32bfee2d'
            '159cd6dd41ab76bd15116ad6d1036758022af7ba8ead5ab3d3c1606d991d3e7d')

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
