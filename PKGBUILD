# Maintainer:

_fontname="readex-pro"
_pkgname="ttf-readex-pro"
pkgbase="$_pkgname"
pkgname=(
  "$pkgbase"
  "$pkgbase-variable"
)
pkgver=1.204
pkgrel=2
pkgdesc="World-script expansion of Lexend font family"
url="https://github.com/ThomasJockin/readexpro"
license=('OFL-1.1-RFN')
arch=('any')

_commit=1a5aaa4c15edb043c37113a8cddf020235917050

_pkgsrc="${_fontname//-}-$_commit"
_pkgext="tar.gz"
source=("$_fontname-$pkgver-${_commit::7}.$_pkgext"::"$url/archive/$_commit.$_pkgext")
sha256sums=('128848eba1ae8fe0454f279a367f5ef0e932949e131382f7b3e26b9373c9a7e4')

prepare() {
  cat > "$pkgbase.conf" <<END
<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "/etc/fonts/conf.d/fonts.dtd">
<fontconfig>

<alias binding="same">
  <family>Lexend</family>
  <prefer>
    <family>Readex Pro</family>
  </prefer>
</alias>

</fontconfig>
END
}

package_ttf-readex-pro() {
  cd "$_pkgsrc"
  install -Dm644 fonts/ttf/*.ttf -t "$pkgdir/usr/share/fonts/$pkgbase/"
  install -Dm644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname/OFL-1.1"

  # lexend font substitution
  install -Dm644 "$srcdir/$pkgbase.conf" "$pkgdir/usr/share/fontconfig/conf.avail/99-$pkgname.conf"
  install -dm755 "$pkgdir/usr/share/fontconfig/conf.default"
  ln -s "../conf.avail/99-$pkgname.conf" "$pkgdir/usr/share/fontconfig/conf.default/"
}

package_ttf-readex-pro-variable() {
  cd "$_pkgsrc"
  install -Dm644 fonts/variable/*.ttf -t "$pkgdir/usr/share/fonts/$pkgbase/"
  install -Dm644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname/OFL-1.1"

  # lexend font substitution
  install -Dm644 "$srcdir/$pkgbase.conf" "$pkgdir/usr/share/fontconfig/conf.avail/99-$pkgname.conf"
  install -dm755 "$pkgdir/usr/share/fontconfig/conf.default"
  ln -s "../conf.avail/99-$pkgname.conf" "$pkgdir/usr/share/fontconfig/conf.default/"
}
