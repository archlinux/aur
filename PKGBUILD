# Maintainer: Network Jack <Network_Jack@null.net>

pkgname=dumpzilla-git
_pkgname=${pkgname%-git}
pkgver=r44.ec337da
pkgrel=2
pkgdesc="Extract All Forensic Interesting Information Of Firefox, Iceweasel And Seamonkey"
arch=('any')
url="https://web.archive.org/web/20250201061909/http://www.dumpzilla.org/"
license=('GPL')
groups=()
depends=('python' 'python-lz4' 'python-magic')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
replaces=()
backup=()
options=()
install=
source=("${_pkgname}::git+https://github.com/Busindre/dumpzilla.git")
noextract=()
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgname}"
  # Git, no tags available
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${_pkgname}"
  # copy main program
  mkdir	-p "${pkgdir}/usr/share/dumpzilla"
  install -Dm755 dumpzilla.py "${pkgdir}/usr/share/dumpzilla/dumpzilla.py"
  cp -r ES_templates_dumpzilla "${pkgdir}/usr/share/dumpzilla/"
  install -d "${pkgdir}/usr/bin/"
  echo '/usr/share/dumpzilla/dumpzilla.py ${@}' > "${pkgdir}/usr/bin/dumpzilla"
  chmod 755 "${pkgdir}/usr/bin/dumpzilla"

  # copy autocomplete
  install -Dm644 dumpzilla "${pkgdir}/usr/share/bash-completion/completions/dumpzilla"
}
