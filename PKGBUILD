# Maintainer: Emil Lundberg <lundberg.emil@gmail.com>
#
# core/community package:
# Maintainer: Lukas Fleischer <archlinux at cryptocrack dot de>
# Contributor: Simon Zimmermann <simon@insmo.com>

pkgname='pass-patched-passmenu-notify-git'
pkgver=latest-passmenu-notify
pkgrel=1
pkgdesc='Stores, retrieves, generates, and synchronizes passwords securely'
arch=('any')
url='http://zx2c4.com/projects/password-store/'
license=('GPL2')
depends=('xclip' 'bash' 'gnupg' 'pwgen' 'tree')
optdepends=('git: for Git support'
            'dmenu: for passmenu')
replaces=('passmenu')
provides=('pass' 'passmenu')
conflicts=('passmenu')
source=("git+ssh://git@github.com/emlun/password-store.git#branch=passmenu-notify")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/password-store/"
  git describe | sed 's/-/./g'
}

package() {
  cd "${srcdir}/password-store/"
  ls -la
  make DESTDIR="${pkgdir}" FORCE_ALL=1 install

  install -Dm0755 contrib/dmenu/passmenu "${pkgdir}/usr/bin/passmenu"
}
