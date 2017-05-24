# Maintainer: Ainola

pkgname=gtk-theme-united-gnome
pkgver=2.1
pkgrel=1
epoch=1
pkgdesc="Based on a Ubuntu 18.04 design concept Flat-Plat as a base."
arch=(any)
url="https://github.com/godlyranchdressing/United-GNOME"
license=('GPL3')
source=("United-Arch-$pkgver"::"https://github.com/godlyranchdressing/United-GNOME/releases/download/V$pkgver/United-Arch.tar.gz"
        "United-Fedora-$pkgver"::"https://github.com/godlyranchdressing/United-GNOME/releases/download/V$pkgver/United-Fedora.tar.gz"
        "United-Manjaro-$pkgver"::"https://github.com/godlyranchdressing/United-GNOME/releases/download/V$pkgver/United-Manjaro.tar.gz"
        "United-OpenSUSE-$pkgver"::"https://github.com/godlyranchdressing/United-GNOME/releases/download/V$pkgver/United-OpenSUSE.tar.gz"
        "United-Solus-$pkgver"::"https://github.com/godlyranchdressing/United-GNOME/releases/download/V$pkgver/United-Solus.tar.gz"
        "United-Ubuntu-$pkgver"::"https://github.com/godlyranchdressing/United-GNOME/releases/download/V$pkgver/United-Ubuntu-alt.tar.gz")
sha256sums=('04935177d93a5a399eb03dd30fac4b720da2e950eee4768823a5bf07119886bd'
            'd44a9231a7517c1fd6b4a802d3eacf2f937b1f703520c74c13fdc8c09eef3833'
            'be210cb363e1ea87f31326a808725a4aecc52eb7ec05d46fd01a4bd4c33c4ee6'
            'f885b78f12fe9e7ebab4e6c73ebc90ad2e9700eed557c4f6514cd07afe26aa09'
            'a409c75c1fc07765008afdc45c1301af23b8a701dd5e7ce438245b8d7d1cdde1'
            '271c47af95374e6dcc4d0426289f5701c689b13885c1bc8c1efffb122e7fd0c4')

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
