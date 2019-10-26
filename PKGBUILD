#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=bauerbill
pkgver=2019
pkgrel=1
pkgdesc='Extension of Powerpill with AUR and ABS support.'
arch=(any)
license=(GPL)
url="https://xyne.archlinux.ca/projects/bauerbill"
depends=('pacman>=5.2.0' pbget pm2ml powerpill python-xdg python3 python3-aur python3-colorsysplus python3-memoizedb python3-xcgf python3-xcpf)
backup=(etc/bauerbill/bauerbill.json)
source=(
  https://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2019.tar.xz
  https://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2019.tar.xz.sig
)
sha512sums=(
  a770007e9639381bbac35f817447845a6b43f5c9de0c6b3aeef431090b4248dcf335575cca7c4e7484878062aa0e38891050050b5ee2135ebfcad510d4b24400
  514e562871bf7d2682f0ec7decf0bc391322c38c93bc41a295cebb9c8db6ed63adc7951cbf09d81da55a87ca92f0af170d6eb97bb23f51dffa65328d952fcc40
)
md5sums=(
  b3f5a97743cdf69217ab7e4717b4fadf
  409d809a3bd631852b586c19faad102a
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
