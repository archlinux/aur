# Maintainer: NAME <EMAIL>
pkgname=pet-git
pkgver=VERSION
pkgrel=1
pkgdesc='Simple command-line snippet manager, written in Go.'
arch=('i686' 'x86_64')
url='https://github.com/knqyf263/pet'
license=('MIT')
depends=('fzf')
makedepends=('go' 'git')
provides=('pet')
conflicts=('pet')
_gourl=github.com/knqyf263/pet

pkgver() {
  date +%Y%m%d
}


build() {
  GOPATH="$srcdir" go get -fix -v -x ${_gourl}
}


package() {
  mkdir -p "$pkgdir/usr/bin"
  install -p -m755 "$srcdir/bin/"* "$pkgdir/usr/bin"

  # Package license (if available)
  for f in LICENSE COPYING LICENSE.* COPYING.*; do
    if [ -e "$srcdir/src/$_gourl/$f" ]; then
      install -Dm644 "$srcdir/src/$_gourl/$f" \
        "$pkgdir/usr/share/licenses/$pkgname/$f"
    fi
  done
  	cd "$srcdir"/src/github.com/knqyf263/pet/misc/completions/zsh/
	install -m0755 -d "$pkgdir"/usr/share/zsh/site-functions
	install -m0644 _* "$pkgdir"/usr/share/zsh/site-functions
}

# vim:set ts=2 sw=2 et:
