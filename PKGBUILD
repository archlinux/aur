# Maintainer: William Belanger <echo d2lsbGlhbS5iZWxyQGdtYWlsLmNvbQ== | base64 -d>

pkgver=r539.e14b34f
pkgrel=1
pkgname=primenote-git
pkgdesc="Fanciest sticky note-taking application"
arch=("any")
url="https://gitlab.com/william.belanger/${pkgname%-git}"
license=("GPL3")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

makedepends=("git" "python-setuptools")
depends=("python" "python-pyqt5" "qt5-svg" "python-requests")
optdepends=("qtermwidget: support for console and Vim modes"
            "gvim: support for Vim mode")

prepare() {
  git clone https://gitlab.com/william.belanger/${pkgname%-git}.git --single-branch
}

pkgver()
{
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package()
{
  cd "${pkgname%-git}"
  python setup.py install --optimize="1" --root="$pkgdir"
}
