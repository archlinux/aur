#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=bauerbill
pkgver=2016.10.9
pkgrel=1
pkgdesc='Extension of Powerpill with AUR and ABS support.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/bauerbill"
depends=(pbget pm2ml powerpill python-xdg python3 python3-aur python3-colorsysplus python3-memoizedb python3-xcgf python3-xcpf)
backup=(etc/bauerbill/bauerbill.json)
source=(
  http://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2016.10.9.tar.xz
  http://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2016.10.9.tar.xz.sig
)
sha512sums=(
  dabf4e2909317883ae84261d9c9de603297f11777d00e559e9aae7c7a244ac0465e790ace191031d80153d7763ecd5a977da08b87901a3f29dec16f958e5880d
  bdd30e0460cc0f36e1858832993ee0dcc3b037c4d37d2f174b5f97365a2d6c973698d5c65bdaa4a80c851e74069fb9f9fd21504e565dd0f530543db69a6f3905
)
md5sums=(
  8ba7eeb2cb917b15ea5c97d4967a0bb6
  1382f4120098c0d4f39e925250db4d9c
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
