#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=bauerbill
pkgver=2017.7
pkgrel=1
pkgdesc='Extension of Powerpill with AUR and ABS support.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/bauerbill"
depends=(pbget pm2ml powerpill python-xdg python3 python3-aur python3-colorsysplus python3-memoizedb python3-xcgf python3-xcpf)
backup=(etc/bauerbill/bauerbill.json)
source=(
  http://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2017.7.tar.xz
  http://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2017.7.tar.xz.sig
)
sha512sums=(
  e86cafa4e22141a8218cbfc5a2207d4e1efb8a892fd9bff89882c707194d2978b0d9bb51600882f57273b46548db973b87bb0751514c1b85ba1bdb1550f8f7b4
  c0e1aa848dec6672318d8e7923baf2ebecfe609ace8e3b55dfffe2f7cfd4e1f06e0af20a871e9d23dea1510023cc05383eb494c4086c039b7c17d09a0201114b
)
md5sums=(
  4cd3ead846715e346ec481c3707c5bb8
  9ab887ea73c2f912dd41c6c99bab4d8d
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
