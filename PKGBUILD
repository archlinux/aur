# Maintainer: Sotirios M. Roussis aka. xtonousou <xtonousou@gmail.com>

pkgname=ship
pkgver=2.6
pkgrel=1
pkgdesc='Simple, handy network addressing multitool with plenty of utilities'
source=('git://github.com/xtonousou/ship.git#branch=master')
url='https://github.com/xtonousou/shIP'
provides=('ship')
conflicts=('ship')
replaces=('ship')
md5sums=('SKIP')
sha256sums=('SKIP')
arch=('any')
license=('GPL3')
depends=('bash>=3.2'
				 'coreutils'
				 'gawk'
				 'grep'
				 'iproute2'
				 'iputils'
				 'mtr'
				 'sed'
				 'traceroute'
				 'wget')
makedepends=('binutils'
						 'coreutils'
					   'git')

prepare() {
  if [ -d "$srcdir/$pkgname" ]; then
    rm -rf "$srcdir/$pkgname"
  fi

  mkdir -p "$srcdir/$pkgname"
  cd "$srcdir/$pkgname"
}

pkgver() {
  cd "$srcdir/$_pkgname"

  printf "%s" "$(git describe --tags | sed 's/v//g')" # expects something like v2.6 => 2.6
}

prepare() {
  cd "$srcdir/$_pkgname"

	echo
	echo "   ▄▄▄▄▄    ▄  █ ▄█ █ ▄▄"
	echo "  █     ▀▄ █   █ ██ █   █"
	echo "▄  ▀▀▀▀▄   ██▀▀█ ██ █▀▀▀"
	echo " ▀▄▄▄▄▀    █   █ ▐█ █"
	echo "              █   ▐  █"
	echo "             ▀        ▀"
	echo
}

package() {
  cd "$srcdir/$_pkgname"

  mkdir -p "$pkgdir/usr/bin"

  install -Dm644 -t "$pkgdir/usr/share/doc/ship/" README.md CHANGELOG.md
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/ship/LICENSE.md"

  rm -rf *.md .git* imgs

	cp -a --no-preserve=ownership ship.sh "$pkgdir/usr/bin/ship"

  chmod a+x "$pkgdir/usr/bin/ship"
}

# vim: ts=2 sw=2 et:
