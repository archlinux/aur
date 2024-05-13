# Maintainer: atomicfs <https://aur.archlinux.org/account/atomicfs>

pkgname=python-langdetect
pkgver=1.0.9
pkgrel=7
pkgdesc="Language detection library ported from Google's language-detection"
arch=('any')
url="https://github.com/Mimino666/langdetect"
license=('Apache-2.0')
depends=(
  'python-six'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-pytest'
)
source=("${pkgname}::git+${url}#commit=a1598f1afcbfe9a758cfd06bd688fbc5780177b2")
# Upstream is a mess, switching between github releases, tags and just commits
sha512sums=('SKIP')

check() {
  cd "${srcdir}/${pkgname}"
  pytest
}

build() {
  cd "${srcdir}/${pkgname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -vDm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
