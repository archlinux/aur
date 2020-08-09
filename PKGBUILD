# Maintainer: Eli W. Hunter <elihunter173@gmail.com>

# This PKGBUILD is maintained on github:
# https://github.com/elihunter173/aur-hercules-git

pkgname=hercules-labours-git
pkgver=10.7.2.r4.g13a2081
pkgrel=1
depends=(
  'python-matplotlib' 'python-scipy' 'python-pandas' 'python-yaml' 'python-protobuf'
  'python-munch' 'python-hdbscan' 'python-seriate' 'python-fastdtw' 'python-dateutil'
  'python-lifelines' 'python-tqdm'
)
makedepends=('go' 'protobuf' 'make' 'git' 'python-setuptools')
pkgdesc='Gaining advanced insights from Git repository history.'
arch=('any')
license=('Apache')
source=('git+https://github.com/src-d/hercules.git')
sha256sums=('SKIP')
url='https://github.com/src-d/hercules'

pkgver() {
  cd "${srcdir}/hercules"
  git describe --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/hercules"
  make
  cd "${srcdir}/hercules/python"
  python setup.py build
}

package() {
  cd "${srcdir}/hercules"
  install -Dm755 hercules "${pkgdir}/usr/bin/hercules"
  cd "${srcdir}/hercules/python"
  python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1 --skip-build
}
