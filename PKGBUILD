# Maintainer: Dory <dory@dory.moe>
pkgname=yaoc-git
_pkgname=yaoc
pkgver=r15.6583961
pkgrel=1
pkgdesc="Yet Another OpenAI CLI: A simple, feature-rich OpenAI client, with tools and vision."
arch=('any')
url="https://github.com/doryiii/yaoc"
license=('GPL-3.0-only')
depends=('python' 'python-html2text' 'python-rich' 'python-termcolor' 'python-requests')
makedepends=('git' 'python-build' 'python-installer')
source=("git+https://github.com/doryiii/yaoc.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_pkgname}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_pkgname}"
	pip install --root="${pkgdir}" --no-deps --no-warn-script-location dist/*.whl
}

