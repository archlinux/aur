#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=bauerbill
pkgver=2017.10
pkgrel=3
pkgdesc='Extension of Powerpill with AUR and ABS support.'
arch=(any)
license=(GPL)
url="https://xyne.archlinux.ca/projects/bauerbill"
depends=(pbget pm2ml powerpill python-xdg python3 python3-aur python3-colorsysplus python3-memoizedb python3-xcgf python3-xcpf)
backup=(etc/bauerbill/bauerbill.json)
source=(
  https://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2017.10.tar.xz
  https://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2017.10.tar.xz.sig
)
sha512sums=(
  1dab78c9b296c3cd10c2f3c58b8a5985a6ffc8ed007dd35783f9ad58d773fbcc08b6e8abec7721889615381109d320fbf65ec0a019a4575b940148e5ad5feff2
  93e73bde362499f352ba650b480aaba6d2b23fa6b39050c93da71c8beaa37a547a80a0d4efdc829ef966389caa8d8b472627894f52cd9676f9dedd17635adcb9
)
md5sums=(
  0c0dc68073782e577a7d7ebeb03c4c7b
  82edc93d159ea13dbe47397224207210
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
