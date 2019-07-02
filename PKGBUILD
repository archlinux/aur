# Maintainer: Aaron McDaniel (mcd1992) <'aur' at the domain 'fgthou.se'>

pkgname=python-pwntools-git
pkgver=3.13.0beta0.r199.gb0e1ce33
pkgrel=1
pkgdesc='A CTF framework and exploit development library. (git branch dev3)'
url='https://github.com/Gallopsled/pwntools'
arch=('any')
license=('GPL')
makedepends=('make')
depends=('python' 'python-intervaltree' 'python-pyelftools' 'python-tox' 'python-mako'
         'python-unicorn' 'python-psutil' 'python-dateutil' 'python-pysocks' 'python-pygments'
         'python-pip' 'python-pyserial' 'python-paramiko' 'ropgadget' 'python-capstone'
         'python-requests' 'python-psutil' 'python-pypandoc' 'python-packaging')
optdepends=('gdb: binary debugging')
source=("${pkgname}::git+https://github.com/Gallopsled/pwntools.git#branch=dev3")
sha256sums=('SKIP')
provides=('python-pwntools')

pkgver() {
  cd ${pkgname}
  # Remove 'v' prefix on tags; prefix revision with 'r'; replace all '-' with '.'
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd ${pkgname}
  #sed -i "s/'sortedcontainers<2.0'/'sortedcontainers'/" setup.py
  #sed -i "s/'intervaltree<3.0'/'intervaltree'/" setup.py
}

build() {
  cd ${pkgname}
  python3 setup.py build
}

package() {
  cd ${pkgname}
  python3 setup.py install --root=${pkgdir}/ --optimize=1
  install -D -m 644 LICENSE-pwntools.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  rm -f ${pkgdir}/usr/lib/python*/site-packages/*.{txt,md}
}
