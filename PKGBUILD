#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=bauerbill
pkgver=2018
pkgrel=1
pkgdesc='Extension of Powerpill with AUR and ABS support.'
arch=(any)
license=(GPL)
url="https://xyne.archlinux.ca/projects/bauerbill"
depends=(pbget pm2ml powerpill python-xdg python3 python3-aur python3-colorsysplus python3-memoizedb python3-xcgf python3-xcpf)
backup=(etc/bauerbill/bauerbill.json)
source=(
  https://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2018.tar.xz
  https://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2018.tar.xz.sig
)
sha512sums=(
  27d973aab4b2b25de2de651ed1be4a663540f667b1860a6ebd0a9dc1a8ec6d67dc90d81860ba992919e9a5141974cd6ba2a730ad92d7ed6699590e7acc2f06f9
  b21c95207014a0091b1c586e528cf0595ebf9e6b9fd3f5c76aa6772a3828c913aa1d2173a77ad2380648aded91e3926db279e3be4dd23acada4a5a6f65044846
)
md5sums=(
  4bb3445ab36f17bcdcfb362c36c77d53
  de534c87f6e96d2473c04e9d1153a5fd
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
