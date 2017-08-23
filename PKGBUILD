#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=bauerbill
pkgver=2017.8
pkgrel=1
pkgdesc='Extension of Powerpill with AUR and ABS support.'
arch=(any)
license=(GPL)
url="https://xyne.archlinux.ca/projects/bauerbill"
depends=(pbget pm2ml powerpill python-xdg python3 python3-aur python3-colorsysplus python3-memoizedb python3-xcgf python3-xcpf)
backup=(etc/bauerbill/bauerbill.json)
source=(
  https://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2017.8.tar.xz
  https://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2017.8.tar.xz.sig
)
sha512sums=(
  54f122cf5fbf95d5fcfb4c3800f998f07f343014ca47d4e3998a8d5258adf03f1c43c79c57f0f7132b6a5f141e640669732cb2e1a6ed35a8b5dca479c7f5fed0
  15c88ef9531f638138de09c6cd703ad08b9637707a00a6b1ddb44352aea163c57439ca36493a6fe61ce9899e8a2bfa297e56aab12e1b9baa866ba99b81924e90
)
md5sums=(
  b8116fffd3799377f7edd21ef46a5758
  5bc2e4c21bc00c536003c3c2061f026b
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
