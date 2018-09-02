# Maintainer: Aaron McDaniel (mcd1992) <'aur' at the domain 'fgthou.se'>

pkgname=python-fsb5-git
pkgver=5acfaed
pkgrel=1
pkgdesc="Library and tool to extract audio from FSB5 (FMOD Sample Bank) files"
url="https://github.com/hearthsim/python-fsb5"
arch=('x86_64')
license=('MIT')
makedepends=('git')
depends=('libogg' 'libvorbis' 'python')
optdepends=()
backup=()
source=("${pkgname}::git+https://github.com/HearthSim/python-fsb5.git")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname}
  # Remove 'v' prefix on tags; prefix revision with 'r'; replace all '-' with '.'
  git describe --long --always | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${pkgname}
  python setup.py build
}

package() {
  cd ${pkgname}
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -DTm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
