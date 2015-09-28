# Maintainer: dryes <joswiseman@cock.li>
pkgname='rescepy-git'
pkgver=47
pkgrel=1
pkgdesc='automated srr (rescene) verification and reconstruction.'
url='https://github.com/d2yes/rescepy'
arch=('any')
license=('MIT')
depends=('cfv' 'python2' 'pyrescene-hg' 'unrar')
makedepends=('git')
source=('git://github.com/d2yes/rescepy.git')
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  echo $(git rev-list --count master)
}

package() {
  cp -r "${srcdir}/rescepy" "${srcdir}/rescepy-build"
  for _d in $(find "${srcdir}/rescepy-build/" -type d -name '.git'); do
    rm -rf "${_d}"
  done
  mkdir -p "${pkgdir}/usr/"{bin,share}
  mv "${srcdir}/rescepy-build" "${pkgdir}/usr/share/rescepy"
  echo -e "#!/bin/bash\n\npython2 /usr/share/rescepy/resce.py \$@" >> "${pkgdir}/usr/bin/rescepy"
  chmod +x "${pkgdir}/usr/bin/rescepy" "${pkgdir}/usr/share/rescepy/resce.py"
}
