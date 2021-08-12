# Maintainer: solnce <echo c29sbmNlQHJhdGFqY3phay5vbmU= | base64 -d>
pkgname=pacdef-git
_pkgname=pacdef
pkgver=0.5.0.r1.g0090b20
pkgrel=1
pkgdesc='declarative manager of Arch packages'
url='https://github.com/steven-omaha/pacdef'
source=("git+https://github.com/steven-omaha/${_pkgname}")
arch=('any')
license=('GPL3')
depends=('python')
conflicts=('pacdef')
provides=('pacdef')
checkdepends=('python-pytest' 'python-mock')
sha256sums=(SKIP)

build() {
  cd "${srcdir}/${_pkgname}"
  _commit=$(git rev-parse --short HEAD)
  sed -i -e "s/VERSION = 'unknown'/VERSION = 'git-${pkgver}-${pkgrel}, commit ${_commit}'/" pacdef.py
}

check() {
  cd "${srcdir}/${_pkgname}"
  pytest -v
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm755 pacdef.py "${pkgdir}/usr/bin/pacdef"
  install -Dm644 _completion.zsh "${pkgdir}/usr/share/zsh/site-functions/_pacdef"
}
