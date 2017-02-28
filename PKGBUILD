#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=bauerbill
pkgver=2017
pkgrel=1
pkgdesc='Extension of Powerpill with AUR and ABS support.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/bauerbill"
depends=(pbget pm2ml powerpill python-xdg python3 python3-aur python3-colorsysplus python3-memoizedb python3-xcgf python3-xcpf)
backup=(etc/bauerbill/bauerbill.json)
source=(
  http://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2017.tar.xz
  http://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2017.tar.xz.sig
)
sha512sums=(
  dab7680af133eb986c32eb9abff8ac9f845f1cf5f5791d9079638d9b16a25b631a6e3717d30cd044b2cd37d21047df492ee234793bd75cbf686f42f799d72404
  1c29ee032f6621f93d881cc14505c17e5299104aea271c973cada1c15c946d6b981f736af0246012987a0e0cd7a458f555ef37d9f5baf4eb4b6eb39df087d595
)
md5sums=(
  40a0b17d427e49fdee7d2abca8733e70
  9646bb2c93f5d7042b685fc8881dd772
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
