# Maintainer: Gore Liu <goreliu@126.com>

pkgname=docker-systemctl-replacement-git
_pkgname=docker-systemctl-replacement
pkgver=516.610695a
pkgrel=1
pkgdesc="docker systemctl replacement"
url='https://github.com/gdraheim/docker-systemctl-replacement'
arch=('any')
license=('GPL')
optdepends=('python2: systemctl.py' 'python3: systemctl3.py')
source=("${_pkgname}::git+https://github.com/gdraheim/docker-systemctl-replacement")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  sed -i 's|#! /usr/bin/python|#! /usr/bin/python2|g' files/docker/systemctl.py
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm755 "files/docker/systemctl.py" "${pkgdir}/usr/bin/systemctl.py"
  install -Dm755 "files/docker/systemctl3.py" "${pkgdir}/usr/bin/systemctl3.py"
}
