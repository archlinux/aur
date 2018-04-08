# Maintainer: Tucker Boniface <tucker@boniface.tech>
# Maintainer: balazs.saros <balazs.saros@gmail.com>
# Contributor: Mice Papai <gothart.hu@gmail.com>
pkgname="cli-typer-git"
_pkgname="cli-typer"
pkgver=r59.0291743
pkgrel=1
pkgdesc="Practice touch typing in the commandline and measure your skills (development version)"
arch=('any')
url="https://github.com/balzss/cli-typer"
license=('GPL')
options=('!strip' '!emptydirs')
makedepends=('git' 'npm')
source=("git+https://github.com/balzss/cli-typer")
md5sums=("SKIP")

pkgver() {
  cd "$srcdir/$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd $srcdir/$_pkgname
  npm install -g --cache "${srcdir}/npm-cache" --user root --prefix "$pkgdir"/usr
  find "${pkgdir}"/usr -type d -exec chmod 755 {} +
}
