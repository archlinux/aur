# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Protesilaos Stavrou <info at protesilaos dot com>
pkgname=tempus-themes-pygments-git
pkgver=r1.dfe76b6
pkgrel=1
pkgdesc="Tempus themes for Pygments"
arch=('any')
url="https://protesilaos.com/tempus-themes"
license=('GPL-3.0-or-later')
depends=('python-pygments')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://gitlab.com/protesilaos/tempus-themes-pygments.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/${pkgname%-git}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
