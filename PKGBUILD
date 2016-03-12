#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=bauerbill
pkgver=2016.3.12
pkgrel=1
pkgdesc='Extension of Powerpill with AUR and ABS support.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/bauerbill"
depends=(pbget pm2ml powerpill python-xdg python3 python3-aur python3-colorsysplus python3-memoizedb python3-xcgf python3-xcpf)
backup=(etc/bauerbill/bauerbill.json)
source=(
  http://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2016.3.12.tar.xz
  http://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2016.3.12.tar.xz.sig
)
sha512sums=(
  c5cc9a5662f738e338a38b77d19b2256ac80004b9edc475fe65dc1bba46a365a03ecdf36a2b5c1d190728a1c4496af1f0cf5cd069fec759ad682066423572e4f
  6792a3547ba46c6ebee971586e6809928293771dfdd3137a522fd7cf5d94f2fcbe929b13af889579049529d646cecc208145837ee447bc9576fad7cc27ba04f2
)
md5sums=(
  3404a984e86f7b31166fc183ec010cbb
  e28f4d04266df697685e904283c9a6d6
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
