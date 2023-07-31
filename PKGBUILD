# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=ofinstaller-beans-git
_pkgname=ofinstaller-beans
pkgver=r177.bcebc68
pkgrel=2
pkgdesc="Open Fortress's quick-n-easy downloading solution"
arch=("x86_64")
url="https://github.com/AdastralGroup/ofinstaller-beans"
license=('GPL3')
depends=("python-pyzstd" "python-rich" "python-tqdm" "python-httpx")
makedepends=("pyinstaller")
provides=("ofinstaller-beans")
conflicts=("ofinstaller-beans")
install=ofinstaller-beans-git.install
source=("git+$url.git"
	"beans")
sha256sums=('SKIP'
            '5ccaed2cc336faa6b58c515a3619ec91fc12b720fe20e70e7799dbb5e80cb4ca')
pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "$srcdir/$_pkgname"
	pyinstaller beans.spec
}

package() {
	cd "$srcdir/$_pkgname"
	install -Dm755 "$srcdir/$_pkgname/dist/beans" "$pkgdir/usr/share/ofinstaller-beans/beans"
	install -Dm755 "$srcdir/beans" "$pkgdir/usr/bin/beans"
}
