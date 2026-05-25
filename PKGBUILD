# Maintainer: Evilleader <evilleader91@gmail.com>
_pkgname=server-picker-x
pkgname=server-picker-x-git
pkgver=1.0.6
pkgrel=1
pkgdesc="Lightweight CS2 and Deadlock GUI server picker for blocking/unblocking server locations"
arch=('any')  
url="https://github.com/FN-FAL113/server-picker-x"
license=('GPL-3.0')
depends=('python' 'python-pillow' 'tk' 'bash')
makedepends=('git')
provides=('server-picker-x')
conflicts=('server-picker-x')
source=("git+${url}.git")
sha256sums=('SKIP')

package() {
  cd "${_pkgname}"

  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/${pkgname}"

  cp -r src/ "${pkgdir}/usr/share/${pkgname}/"
  cp -r assets/ "${pkgdir}/usr/share/${pkgname}/"

  # The wrapper script name automatically becomes /usr/bin/server-picker-x-git
  echo -e "#!/bin/bash\ncd /usr/share/${pkgname}\npython src/main.py \"\$@\"" > "${pkgdir}/usr/bin/${pkgname}"
  chmod +x "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
