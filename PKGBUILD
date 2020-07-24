# Maintainer: Eli W. Hunter <elihunter173@gmail.com>

# This PKGBUILD is maintained on github:
# https://github.com/elihunter173/aur-hercules-git

pkgname=hercules-analysis-git
pkgver=10.7.2.r4.g13a2081
pkgrel=1
depends=('go' 'protobuf')
makedepends=('make' 'git' 'python-setuptools')
pkgdesc='Gaining advanced insights from Git repository history.'
arch=('any')
license=('Apache')
source=('git+https://github.com/src-d/hercules.git')
sha256sums=('SKIP')
url='https://github.com/src-d/hercules'
optdepends=(
    'python-matplotlib: to use the labours python script'
    'python-scipy: to use the labours python script'
    'python-pandas: to use the labours python script'
    'python-yaml: to use the labours python script'
    'python-protobuf: to use the labours python script'
    'python-munch: to use the labours python script'
    'python-hdbscan: to use the labours python script'
    'python-seriate: to use the labours python script'
    'python-fastdtw: to use the labours python script'
    'python-dateutil: to use the labours python script'
    'python-lifelines: to use the labours python script'
    'python-tqdm: to use the labours python script'
)

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
