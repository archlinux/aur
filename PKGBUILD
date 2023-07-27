# Maintainer: Lahfa Samy (AkechiShiro) <'akechishiro-aur' at the domain 'lahfa.xyz'>
# Contributor: Aaron McDaniel (mcd1992) <'aur' at the domain 'fgthou.se'>
pkgname=python-pwntools-git
pkgver=4.9.0beta0.r1.g7f5866ab
pkgrel=1
pkgdesc='A CTF framework and exploit development library. (git branch dev)'
url='https://github.com/Gallopsled/pwntools'
arch=('any')
license=('GPL')
makedepends=('make' 'git')
conflicts=('python-pwntools')
depends=('python' 'python-intervaltree' 'python-pyelftools' 'python-tox' 'python-mako'
         'python-unicorn-git' 'python-psutil' 'python-dateutil' 'python-pysocks' 'python-pygments'
         'python-pip' 'python-pyserial' 'python-paramiko' 'ropgadget' 'python-capstone'
         'python-requests' 'python-psutil' 'python-packaging' 'python-rpyc' 'python-colored-traceback')
optdepends=('gdb: binary debugging')
source=("${pkgname}::git+https://github.com/Gallopsled/pwntools.git#branch=dev")
sha256sums=('SKIP')
provides=('python-pwntools')

pkgver() {
  cd ${pkgname}
  # Remove 'v' prefix on tags; prefix revision with 'r'; replace all '-' with '.'
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd ${pkgname}
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
