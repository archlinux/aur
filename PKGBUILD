# Maintainer: David Vogt <dave at winged dot ch>
# This PKGBUILD is maintained at https://github.com/winged/aur-packages

pkgname=python2-neovim-git
_pkgname=python2-neovim-git
pkgver=0.r242.8051657
pkgrel=1
pkgdesc="Python client to neovim, git version. Use this to keep up with neovim-git"
arch=('any')
license=('Apache2')
url=('http://github.com/neovim/python-client')
depends=('python2'
         'python2-msgpack'
         'python2-greenlet'
         'python2-trollius'
         'python2-futures'
         'python2-cffi'
         'python2-click'
         'python2-setuptools'
         )
conflicts=(
  'python2-neovim'
)
provides=('python2-neovim')
makedepends=('git')
source=("$pkgname::git://github.com/neovim/python-client.git"
        "LICENSE::https://raw.githubusercontent.com/neovim/python-client/master/LICENSE")
sha256sums=('SKIP' '297a62ff61eb84f532ff5a8181860d925b710d4458f204e56c90b1da997c8711')

pkgver() {
  cd "${_pkgname}"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_pkgname"
  python2 setup.py install --root="$pkgdir" --optimize=1
  mv "$pkgdir/usr/bin/pynvim" "$pkgdir/usr/bin/pynvim2"
  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
