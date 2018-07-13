# Maintainer: William Belanger <echo d2lsbGlhbS5iZWxyQGdtYWlsLmNvbQ== | base64 -d>

pkgname=qoob-git
pkgver=0
pkgrel=1
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
pkgdesc="Cross-platform foobar-like music player"
url="https://gitlab.com/william.belanger/${pkgname%-git}"
arch=("any")
license=("GPL3")
depends=("python>=3" "python-pyqt5" "qt5-svg" "qt5-multimedia" "python-mutagen")
source=("git+https://gitlab.com/william.belanger/${pkgname%-git}.git")
md5sums=("SKIP")

pkgver()
{
  cd "${pkgname%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package()
{
  cd "${pkgname%-git}"
  python setup.py install --optimize="1" --root="$pkgdir"
}
