# Maintainer: dryes <joswiseman@cock.li>
pkgname='rescepy-git'
_pkgname='rescepy'
pkgver=r56.e47807e
pkgrel=1
pkgdesc='automated srr (rescene) verification and reconstruction.'
url='https://github.com/dryes/rescepy'
arch=('any')
license=('MIT')
depends=('cfv' 'python' 'pyrescene' 'unrar')
makedepends=('git')
source=('git+https://github.com/dryes/rescepy.git')
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  #git describe --tags | sed 's/-/+/g'
   printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}
package() {
  cp -r "${srcdir}/rescepy" "${srcdir}/rescepy-build"
  for _d in $(find "${srcdir}/rescepy-build/" -type d -name '.git'); do
    rm -rf "${_d}"
  done
  mkdir -p "${pkgdir}/usr/"{bin,share}
  mv "${srcdir}/rescepy-build" "${pkgdir}/usr/share/rescepy"
  chmod +x "${pkgdir}/usr/bin/rescepy" "${pkgdir}/usr/share/rescepy/resce.py"
}
