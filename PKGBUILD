# Maintainer: William Belanger <echo d2lsbGlhbS5iZWxyQGdtYWlsLmNvbQ== | base64 -d>

pkgver=r495.034643f
pkgrel=1
pkgname=primenote-git
pkgdesc="Fanciest sticky note-taking application"
arch=("any")
url="https://gitlab.com/william.belanger/${pkgname%-git}"
license=("GPL3")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

makedepends=("git")
depends=("python" "python-setuptools" "python-pyqt5" "python-requests")
optdepends=("qtermwidget: support for console and Vim modes"
            "vim: support for Vim mode")

pkgver()
{
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  git clone https://gitlab.com/william.belanger/${pkgname%-git}.git --single-branch
}

package()
{
  cd "${pkgname%-git}"
  python setup.py install --optimize="1" --root="$pkgdir"
}
