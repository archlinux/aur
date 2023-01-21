pkgname=fcitx5-gruvbox-dark-theme-git
pkgver=20211015.r6.a301ac5
pkgrel=2
pkgdesc="fcitx5 gruvbox dark theme"
arch=('any')
url="https://github.com/pu-007/fcitx5-gruvbox-dark-theme"
source=("${pkgname}::git+https://github.com/pu-007/fcitx5-gruvbox-dark-theme.git")
sha512sums=('SKIP')

pkgver() {
    cd "$srcdir"/${pkgname}
    local date=$(git log -1 --format="%cd" --date=short | sed s/-//g)
    local count=$(git rev-list --count HEAD)
    local commit=$(git rev-parse --short HEAD)
    echo "$date.r${count}.$commit"
}

package() {
  cd ${pkgname}
  install -Dm644 arrow.png radio.png -t "$pkgdir"/usr/share/$pkgname/
  for _variant in aqua blue green purple red yellow; do
    _variant_name=gruvbox-dark-${_variant}
    install -dm755 "$pkgdir"/usr/share/fcitx5/themes/$_variant_name/
    ln -s ../../../$pkgname/arrow.png "$pkgdir"/usr/share/fcitx5/themes/$_variant_name/
    ln -s ../../../$pkgname/radio.png "$pkgdir"/usr/share/fcitx5/themes/$_variant_name/
    install -Dm644 theme-$_variant.conf "$pkgdir"/usr/share/fcitx5/themes/$_variant_name/theme.conf
    install -Dm644 separator-$_variant.png "$pkgdir"/usr/share/fcitx5/themes/$_variant_name/separator-${_variant}.png
    sed -i "s/^Name=.*/Name=$_variant_name/" "$pkgdir"/usr/share/fcitx5/themes/$_variant_name/theme.conf
  done
}
