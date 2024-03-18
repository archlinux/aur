# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com

set -u
_pkgname='tab'
pkgname="${_pkgname}-git"
pkgver=9.2.r3.gecb7eca
pkgrel=1
pkgdesc="A modern text processing language similar to awk in spirit. (But not similar in design philosophy, implementation or syntax.)"
arch=('x86_64' 'i686')
#url='https://bitbucket.org/tkatchev/tab'
url='https://github.com/ivan-tkatchev/tab'
license=('BSL-1.0')
makedepends=('git' 'gcc')
provides=("${_pkgname}") # =${pkgver%%.r*} # Not useful until we get a version better than a date.
conflicts=("${_pkgname}")
_srcdir="${pkgname}"
source=("${_srcdir}::git+${url}.git")
md5sums=('SKIP')
sha256sums=('SKIP')

pkgver() {
  set -u
  cd "${_srcdir}"
  # git log -n1 --format='%ci'
  #printf "%s.r%s.%s" "$(git log -n1 --format='%ci' | cut -d' ' -f1 | sed -e 's:-::g')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  git describe --long --tags | sed -E -e 's/([^-]*-g)/r\1/' -e 's/-/./g'
  set +u
}

build() {
  set -u
  cd "${_srcdir}"
  nice make -s
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
