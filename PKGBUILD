# Maintainer: Wolfgang Popp <mail@wolfgang-popp.de>
pkgname=ytcc-git
pkgver=r296.094f3ef
pkgrel=1
pkgdesc="Command line tool to keep track of playlists"
arch=('any')
url="https://github.com/woefe/ytcc"
license=('GPL3')
depends=('python-click' 'youtube-dl')
optdepends=('mpv' 'fzf')
makedepends=('git' 'python-setuptools')
source=("$pkgname::git+https://github.com/woefe/ytcc.git")
sha256sums=('SKIP')

pkgver(){
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm755 scripts/ytccf.sh "${pkgdir}/usr/bin/ytccf"
  install -Dm644 completions/zsh/_ytcc "${pkgdir}/usr/share/zsh/site-functions/_ytcc"
  install -Dm644 completions/fish/ytcc.fish "${pkgdir}/usr/share/fish/vendor_completions.d/ytcc.fish"
}

# vim:set ts=2 sw=2 et:
