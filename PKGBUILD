# Maintainer: Hai Zhang <dreaming.in.code.zh@gmail.com>

# Taken from android-sdk-platform-tools

_pkgname=android-sdk-platform-tools
pkgname="${_pkgname}-dummy"
pkgver=28.0.1
pkgrel=1
_pkgdesc='Platform-Tools for Google Android SDK (adb and fastboot)'
pkgdesc="${_pkgdesc}, dummy package"
arch=('x86_64')
url='http://developer.android.com/sdk/index.html'
license=('custom')
depends=('zlib' 'ncurses')
provides=("${_pkgname}" 'adb' 'android-tools')
conflicts=("${_pkgname}" 'adb')
install="${pkgname}.install"
source=("adb.service::https://aur.archlinux.org/cgit/aur.git/plain/adb.service?h=android-sdk-platform-tools"
        "license.html::https://aur.archlinux.org/cgit/aur.git/plain/license.html?h=android-sdk-platform-tools")
sha256sums=('1c219abea7584ae13f3f76b04e269ef21c1699d6bd29b7615523f927a9d10deb'
            'a7f3a259290ae6a5dc61bd34ecae36e2b7e2f644865ddc3c7fde5d248b8a7cef')

package() {

  install -Dm644 "${srcdir}/adb.service" "${pkgdir}/usr/lib/systemd/system/adb.service"
  install -Dm644 "${srcdir}/license.html" "${pkgdir}/usr/share/licenses/$pkgname/license.html"

  install -d "${pkgdir}/etc/profile.d/"
  echo 'export PATH="${PATH}:/opt/android-sdk/platform-tools"' >"${pkgdir}/etc/profile.d/${_pkgname}.sh"
  echo 'setenv PATH "${PATH}:/opt/android-sdk/platform-tools"' >"${pkgdir}/etc/profile.d/${_pkgname}.csh"
  chmod 755 "${pkgdir}/etc/profile.d/${_pkgname}".{sh,csh}
}
