# Maintainer: dryes <joswiseman@cock.li>
pkgname='rsigh-git'
pkgver=5
pkgrel=1
pkgdesc='post encrypted files to usenet.'
url='https://github.com/d2yes/rsigh'
arch=('any')
license=('GPL')
depends=('python' 'truecrypt' 'par2cmdline' 'rar' 'unrar' 'newsmangler-git')
makedepends=('git')
source=('git://github.com/d2yes/rsigh.git')
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  echo $(git rev-list --count master)
}

package() {
  for _d in $(find "${srcdir}" -type d -name '.git'); do
    rm -rf "${_d}"
  done
  mkdir -p "${pkgdir}/usr/"{bin,share}
  mv "${srcdir}/rsigh" "${pkgdir}/usr/share/"
  echo -e "#!/bin/bash\n\npython /usr/share/rsigh/rsigh.py \$@" >> "${pkgdir}/usr/bin/rsigh"
  chmod +x "${pkgdir}/usr/bin/rsigh" "${pkgdir}/usr/share/rsigh/rsigh.py"
}
