# Maintainer: Yann Büchau <nobodyinperson at posteo de>
# Contributor: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Hao Long <imlonghao@archlinuxcn.org>

pkgname=python-rich-cli-git
pkgver=1.8.0.r6.g0721cb1
pkgrel=2
pkgdesc='command line toolbox for fancy output in the terminal'
arch=(any)
url='https://github.com/Textualize/rich-cli'
license=('MIT')
depends=('python-rich' 'python-click' 'python-requests' 'python-textual' 'python-rich-rst-git')
makedepends=('python-pip' 'python-poetry')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("${pkgname%-git}::git+$url")
md5sums=('SKIP')

pkgver () {
    cd "$srcdir/${pkgname%-git}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
  cd "$srcdir"/"${pkgname%-git}"
  poetry build --format wheel
}

package() {
  cd "$srcdir"/"${pkgname%-git}"
  PIP_CONFIG_FILE=/dev/null pip install --isolated --no-warn-script-location --root="${pkgdir}" --ignore-installed --no-deps dist/*.whl
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
