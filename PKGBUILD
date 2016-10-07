#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=bauerbill
pkgver=2016.10
pkgrel=1
pkgdesc='Extension of Powerpill with AUR and ABS support.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/bauerbill"
depends=(pbget pm2ml powerpill python-xdg python3 python3-aur python3-colorsysplus python3-memoizedb python3-xcgf python3-xcpf)
backup=(etc/bauerbill/bauerbill.json)
source=(
  http://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2016.10.tar.xz
  http://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2016.10.tar.xz.sig
)
sha512sums=(
  69e3c2a01d9c11850229f85ef6289fe23cf2a8a2be5a7388efea0685d0a23e09bbbf18417c66efd28ec3f050b1e70773622d8e9a4ed0c984f7f3cade935f9ac0
  85a3775c85b185ac01e06a9f1e7b244a49e202fee5f3b6a722874f069be9c71d872fd929cfaa82d3529c9a879470d33d36673915c375e3810be68b649b325649
)
md5sums=(
  1212364129197fbc2580714327c9f6d7
  0568457786cc2ceebb9205a095d305c2
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
