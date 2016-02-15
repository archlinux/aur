#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=bauerbill
pkgver=2016.2.15
pkgrel=1
pkgdesc='Extension of Powerpill with AUR and ABS support.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/bauerbill"
depends=(pbget pm2ml powerpill python-xdg python3 python3-aur python3-colorsysplus python3-memoizedb python3-xcgf python3-xcpf)
backup=(etc/bauerbill/bauerbill.json)
source=(
  http://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2016.2.15.tar.xz
  http://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2016.2.15.tar.xz.sig
)
sha512sums=(
  e08cb76b189cf0f876248a129f753bea1c775d16c5814047b0a04685bea7c9edd8aaf32991c3ab89395e770166ecf21cfb6de9fd0114b19534d810ef13df4cd0
  de8f9e78b709be1de06ffcc60f74ee0d246d84fe3333b5f3b70d01bcfc0ba38e5970a1da352f06fa54eba01f498d0121364f0047510afb62b731d91e3fa8c2ca
)
md5sums=(
  e62ce5779a07c8b51d7aa0c898262796
  08637ff310444d1a89557bde5b4f164d
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm644 "bauerbill.json" "$pkgdir/etc/bauerbill/bauerbill.json"
  install -Dm644 "man/bauerbill.json.1.gz" "$pkgdir/usr/share/man/man1/bauerbill.json.1.gz"
  install -Dm644 "bauerbill-bash-completion.sh" "$pkgdir/usr/share/bash-completion/completions/bauerbill"
  for bb in bauerbill bb-*
  do
    if [[ -x $bb ]]
    then
      install -Dm755 "$bb" "$pkgdir/usr/bin/$bb"
    fi
  done
  install -Dm755 makepkgx "$pkgdir/usr/bin/makepkgx"
}

# vim: set ts=2 sw=2 et:
