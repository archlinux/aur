# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com

set -u
_pkgname='tab'
pkgname="${_pkgname}-git"
pkgver=20150731.r138.1c27b59
pkgrel=1
pkgdesc="A modern text processing language similar to awk in spirit. (But not similar in design philosophy, implementation or syntax.)"
arch=('x86_64' 'i686')
url='https://bitbucket.org/tkatchev/tab'
license=('BSL')
makedepends=('git' 'gcc')
provides=("${_pkgname}") # =${pkgver%%.r*} # Not useful until we get a version better than a date.
conflicts=("${_pkgname}")
_srcdir="${pkgname^^}"
source=("${_srcdir}::git+https://bitbucket.org/tkatchev/tab.git")
sha256sums=('SKIP')

pkgver() {
  set -u
  cd "${_srcdir}"
  printf "%s.r%s.%s" "$(git show -s --format=%ci HEAD | cut -d' ' -f1 | sed -e 's:-::g')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  #git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
  set +u
}

build() {
  set -u
  cd "${_srcdir}"
  make -s -j "$(nproc)"
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  install -Dpm755 'tab' -t "${pkgdir}/usr/bin/"
  install -Dpm644 'LICENSE.txt' -t "${pkgdir}/usr/share/licenses/${_pkgname}/"
  set +u
}
set +u
