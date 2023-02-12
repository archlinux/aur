# Maintainer: Nicholas Novak <34256932+NickyBoy89@users.noreply.github.com>

pkgname=excalidraw-cli
pkgver=r131.2d6f180
pkgrel=1
pkgdesc="Experimental Excalidraw CLI tool "
arch=('any')
makedepends=('git' 'yarn')
checkdepends=('npm')
provides=('excalidraw-cli')
depends=('nodejs')
url="https://github.com/tommywalkie/excalidraw-cli"
license=('MIT')
source=(
  "excalidraw-cli::git+https://github.com/tommywalkie/excalidraw-cli"
)
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

check() {
  cd "$srcdir/$pkgname"
  npm run test
}

build() {
  cd "$srcdir/$pkgname"
  # `canvas` ships with a version that requires a previous version of node
  # This can be removed, but requires lts-gallium (nodejs=16.16.0)
  yarn upgrade canvas@2.11.0
  yarn
  yarn prepack
}

package() {
	mkdir -p "$pkgdir/usr/share/"
	cp -r "$srcdir/$pkgname/" "$pkgdir/usr/share/$pkgname/"

  mkdir -p "$pkgdir/usr/bin/"
  ln -s "/usr/share/$pkgname/bin/run" "$pkgdir/usr/bin/excalidraw-cli"
}
