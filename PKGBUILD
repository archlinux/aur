#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=bauerbill
pkgver=2017.3.30
pkgrel=1
pkgdesc='Extension of Powerpill with AUR and ABS support.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/bauerbill"
depends=(pbget pm2ml powerpill python-xdg python3 python3-aur python3-colorsysplus python3-memoizedb python3-xcgf python3-xcpf)
backup=(etc/bauerbill/bauerbill.json)
source=(
  http://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2017.3.30.tar.xz
  http://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2017.3.30.tar.xz.sig
)
sha512sums=(
  6241e6d3ca9b1d223b47c8a093ed7b250c87c2fc3f158405aa63ab9a472ae8af4c401320adde5e148bb7a7f1c4851439d5a68801b99274636447336237b098e8
  0794c6d70e365fa79ffd39d0ee8d88e72bf2200710218f440804aad065ff08af45f04631cb9020d6893586068160c3eafa25ab499fab5ec780a43070e7f7fd55
)
md5sums=(
  c22ef33dc1223d46bd04fbbc58844122
  b9dedcefcdc5cbd7696db3f068543106
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
