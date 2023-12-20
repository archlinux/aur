# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-setuptools-git-ls-files-git
pkgver=0.1.1.r1.g2327ed6
pkgrel=2
pkgdesc='setuptools plugin to list all files tracked by git, recursing into submodules'
url='https://github.com/anthrotype/setuptools_git_ls_files'
license=('MIT')
arch=(any)
depends=(python)
makedepends=(python-{build,installer}
              python-setuptools-scm
              python-wheel
              git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare()
{
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    cd "$pkgname"
    python -m build -wn
}

package() {
    cd "$pkgname"
    python -m installer -d "$pkgdir" dist/*.whl
}

