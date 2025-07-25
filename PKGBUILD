# Maintainer: Jonathan Liu <net147@gmail.com>
pkgname=softethervpn-client-manager
pkgver=v4.44_9807
_realpkgver=${pkgver//_/-}-rtm-2025.04.16
_exe="softether-vpnclient-${_realpkgver}-windows-x86_x64-intel.exe"
pkgrel=1
pkgdesc="SoftEther VPN Client Manager"
arch=('i686' 'x86_64')
url="https://www.softether.org/"
license=('Apache')
depends=('desktop-file-utils' 'wine')
makedepends=('gzip' 'icoutils')
source=("https://www.softether-download.com/files/softether/${_realpkgver}-tree/Windows/SoftEther_VPN_Client/${_exe}"
        'vpncmgr.desktop'
        'vpncmgr.png'
        'vpncmgr.sh'
        'vpncmgr-remote.desktop'
        'vpncmgr-remote.sh')
md5sums=('002322a3adc9b1b9a8c35492624ec604'
         '98c8ca04d44309eb6902e6db718a78e3'
         '2700860e1d40d685894aa88b0e0d42f1'
         '72769397b0ca79ff92de136dbf8ec7ad'
         '4f7f7176fc26843a9eb6e722ecd3ff88'
         '572d8e51348aa8e3a4b1402c4ebc82dc')

package() {
  install -D -m 755 vpncmgr.sh "${pkgdir}/usr/bin/vpncmgr"
  install -D -m 755 vpncmgr-remote.sh "${pkgdir}/usr/bin/vpncmgr-remote"
  install -d "${pkgdir}/usr/lib/softethervpn/vpncmgr"
  wrestool -x --type='DATAFILE' --name=RAW_HAMCORE.SE2 --raw "${_exe}" > "${pkgdir}/usr/lib/softethervpn/vpncmgr/hamcore.se2"
  (printf "\x1f\x8b\x08\x00\x00\x00\x00\x00"; wrestool -x --type='DATAFILE' --name=VPNCMGR.EXE --raw "${_exe}" | tail -c +5) | gzip -dc > "${pkgdir}/usr/lib/softethervpn/vpncmgr/vpncmgr.exe" 2>/dev/null || true
  install -D -m 644 vpncmgr.desktop "${pkgdir}/usr/share/applications/vpncmgr.desktop"
  install -D -m 644 vpncmgr-remote.desktop "${pkgdir}/usr/share/applications/vpncmgr-remote.desktop"
  install -D -m 644 vpncmgr.png "${pkgdir}/usr/share/pixmaps/vpncmgr.png"
}

# vim:set ts=2 sw=2 et:
