#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=bauerbill
pkgver=2017.3.29
pkgrel=1
pkgdesc='Extension of Powerpill with AUR and ABS support.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/bauerbill"
depends=(pbget pm2ml powerpill python-xdg python3 python3-aur python3-colorsysplus python3-memoizedb python3-xcgf python3-xcpf)
backup=(etc/bauerbill/bauerbill.json)
source=(
  http://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2017.3.29.tar.xz
  http://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2017.3.29.tar.xz.sig
)
sha512sums=(
  03a45e82d2dc4d470bbc03c8ce96b18726aa9ba1a4d5508a2edacd05e2e8af41d5e7dc52a42580560ba1d5d3242c91ea841b5853eab1b2e7fdebd4c0ce5ff90c
  6c9275ae01e66eea2db032e75938033f0576e5aa9ff02de4a008c1fcbf7782021728221faec1555c7415fba46faec1355258fd71559c950087f7674d6d293648
)
md5sums=(
  4bc2f22316e6823df77fbb9a08bf4db0
  d5b2fb75d31932bc236219cfd2046e4b
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
