#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=bauerbill
pkgver=2015.12
pkgrel=1
pkgdesc='Extension of Powerpill with AUR and ABS support.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/bauerbill"
depends=(python3 powerpill python3-xcpf python3-aur pm2ml pbget)
backup=(etc/bauerbill/bauerbill.json)
source=(
  http://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2015.12.tar.xz
  http://xyne.archlinux.ca/projects/bauerbill/src/bauerbill-2015.12.tar.xz.sig
)
sha512sums=(
  5fdb2533df6e40121198841baa4bfa57ff50e2ebe2f14898007a51d06502e6d97c66887ac432c3aa9a1806f98d20310a40f0a68bd3bcaee0695e9bd58d455eb8
  237d3e4ed458135bb98cbb0ce54e67f02334d0944bc10a6130bcac38c95f9a5690f84bdb39a52d969dc1519bfa273897edfec69e26aea68584c9549aa9fa1dfd
)
md5sums=(
  faf48db9ceebaf0fa55f3c3b38defcaa
  6352ba978eca82a669cee504488cd2b2
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
}

# vim: set ts=2 sw=2 et:
