# Maintainer:  Dan McCombs <dsmccombs@gmail.com>

pkgname=yubiguard-git
_gitname=YubiGuard
pkgver=0.9.3.r145.a16c8a3.r145.a16c8a3
pkgrel=1
pkgdesc="Python script to protect against accidental triggering of YubiKeys on Linux."
url="https://github.com/dmccombs/YubiGuard"
arch=('any')
license=('GPL3')
makedepends=('git')
depends=('xorg-xinput' 'python-pyzmq' 'python-gobject')
source=('git+https://github.com/dmccombs/YubiGuard'
        'YubiGuard.desktop')
md5sums=('SKIP'
         'c1d6573df66b0659c7c5f85f023f4454')

pkgver() {
  cd ${_gitname}
  printf "${pkgver}.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  sed -i -e 's;./icons;/usr/share/pixmaps/YubiGuard;' "${_gitname}/YubiGuard/YubiGuard.py"
}

# This should install icons and handle them being somewhere other than the
# script, or there should be a helper script
package() {
  install -Dm644 "${_gitname}/LICENSE" "${pkgdir}/usr/share/licenses/YubiGuard/LICENSE"
  install -Dm644 "${_gitname}/YubiGuard/icons/nokey_icon.svg" "${pkgdir}/usr/share/pixmaps/YubiGuard/nokey_icon.svg"
  install -Dm644 "${_gitname}/YubiGuard/icons/on_icon.svg" "${pkgdir}/usr/share/pixmaps/YubiGuard/on_icon.svg"
  install -Dm644 "${_gitname}/YubiGuard/icons/off_icon.svg" "${pkgdir}/usr/share/pixmaps/YubiGuard/off_icon.svg"
  install -Dm644 "${_gitname}/YubiGuard/icons/off_icon.svg" "${pkgdir}/usr/share/pixmaps/YubiGuard.svg"
  install -Dm755 "${_gitname}/YubiGuard/YubiGuard.py" "${pkgdir}/usr/bin/YubiGuard"
  install -Dm644 "${srcdir}/YubiGuard.desktop" "${pkgdir}/usr/share/applications/YubiGuard.desktop"
}
