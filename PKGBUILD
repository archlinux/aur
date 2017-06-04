# Maintainer: Ainola

pkgname=gtk-theme-united-gnome
pkgver=2.1.3
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
sha256sums=('b4c542df226952ced0c158cfddcb2b3c5a33e078a28ffddf00fae6e185b8abaf'
            'd40f6d1092f93de2d924e738bc56dfa51e53e364c2d2cc36cd1ee4f2424949fc'
            '1c573d007fd4ae89a97164199db740b0dc265de93962d08027521a3b3820d0da'
            '39bf989ae61bb2af24855581ffd65ae3315330b90df4d4ffe3bb5ff083a4434f'
            '58683263ebd55ebe07f4fb20089b7aa822b0d9df50692768e08320f5463bd54f'
            '50ed87d670bc2b47f0a7d690eff0146f82bac62c91aba5bfac45e2aec5590248')

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
