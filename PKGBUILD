#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=bauerbill
pkgver=2016.4.20
pkgrel=1
pkgdesc='Extension of Powerpill with AUR and ABS support.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/bauerbill"
depends=(pbget pm2ml powerpill python-xdg python3 python3-aur python3-colorsysplus python3-memoizedb python3-xcgf python3-xcpf)
backup=(etc/bauerbill/bauerbill.json)
source=(
  http://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2016.4.20.tar.xz
  http://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2016.4.20.tar.xz.sig
)
sha512sums=(
  bc7a6891af47abfec6a810c32e6a52615d57b49d37435e6e0053229e91b4f5bf2505630d13e12cc7d3e8fced981d6609f4809dfa825de65d13adf7725d533d65
  c0d7210c29d403102e0f892950e3aaef3294889d58726200ed4cc46c1379826b4f5d61bd46f2314afa4435827ffcf7d5daac2f78500e43147f5ebe71a7b11754
)
md5sums=(
  68d57b1a6c19b112459f91ec43d5d411
  16b1fba444ebd4782e85952184893406
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
