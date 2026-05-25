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

  # 1. Create target directories inside the installation package
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/${pkgname}"

  # 2. Copy the files directly from the root repository folder
  # We copy everything, but exclude hidden .git folders and the LICENSE
  cp -r *.py locales/ img/ "${pkgdir}/usr/share/${pkgname}/" 2>/dev/null || true
  
  # If they put files directly in root, let's grab the main ones safely
  cp *.py "${pkgdir}/usr/share/${pkgname}/" 2>/dev/null || true

  # 3. Create the launcher wrapper script pointing to the root main.py
  echo -e "#!/bin/bash\ncd /usr/share/${pkgname}\npython main.py \"\$@\"" > "${pkgdir}/usr/bin/${pkgname}"
  chmod +x "${pkgdir}/usr/bin/${pkgname}"

  # 4. Install the LICENSE file
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
