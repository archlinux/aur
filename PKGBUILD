# Maintainer: Trougnouf (Benoit Brummer) <trougnouf at gmail dot com>
pkgname=nubertctl-git
_pkgname=nubertctl
pkgver=r2.7c392d4
pkgrel=1
pkgdesc="Unofficial CLI to control Nubert X/XS/A series speakers via BLE"
arch=('any')
url="https://codeberg.org/trougnouf/nubertctl"
license=('GPL3')
depends=('python-bleak')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_pkgname"
  
  # Install the python script as 'nubertctl' in /usr/bin/
  install -Dm755 nubertctl.py "${pkgdir}/usr/bin/nubertctl"
  
  # Install documentation
  if [ -f README.md ]; then
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  fi
  
  # Install license
  if [ -f LICENSE ]; then
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  fi
}
