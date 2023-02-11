# Maintainer: libele <libele@disroot.org>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Gilrain <pierre.buard+aur gmail com>
# Contributor: bruenig

pkgname=packer-aur
_pkgname=packer
pkgver=20160325
pkgrel=3
pkgdesc="Bash wrapper for pacman and aur"
url="http://github.com/keenerd/packer"
license=("GPL3")
arch=('any')
makedepends=('git')
depends=('grep' 'sed' 'bash' 'curl' 'pacman' 'jshon' 'expac')
optdepends=('sudo: install and update packages as non-root'
            'customizepkg: apply customizepkg modifications')
conflicts=('packer')
source=('git+https://github.com/keenerd/packer.git')
md5sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
}

package() {
  sed -i 's/rpc.php\///g' "$srcdir/$_pkgname/packer"
  install -Dm755 "$srcdir/$_pkgname/packer" "$pkgdir/usr/bin/packer"
  install -Dm644 "$srcdir/$_pkgname/packer.8" "$pkgdir/usr/share/man/man8/packer.8"
}

