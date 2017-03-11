#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=bauerbill
pkgver=2017.3
pkgrel=1
pkgdesc='Extension of Powerpill with AUR and ABS support.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/bauerbill"
depends=(pbget pm2ml powerpill python-xdg python3 python3-aur python3-colorsysplus python3-memoizedb python3-xcgf python3-xcpf)
backup=(etc/bauerbill/bauerbill.json)
source=(
  http://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2017.3.tar.xz
  http://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2017.3.tar.xz.sig
)
sha512sums=(
  a318f50fc9bca00f825a0547ab26273d70734954c2244c5000795cf89a1730990abe9ab2bc1bd1057280c091715837575dceae2505bb2f535387b14866a99ca0
  41862c8e1af19bbbc2faf6913c17d1e77a7269fa626a4b4902f09b341d8793fe3546bac20ac0a117815110d05307d98e6dd71f75f0cb30f1df0456177ae1121b
)
md5sums=(
  8b54c4beceaa3018409e808e635a3246
  a6bc6f01beb7d1d3d4e8124e5e24718c
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
