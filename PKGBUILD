# Maintainer: jiangjie <kero_jiang at 126 dot com>

pkgname=workdaddy-bin
pkgver=1.2.22
pkgrel=3
pkgdesc='WorkBuddy desktop enhancement assistant (WorkDaddy, official Linux DEB repack)'
arch=('x86_64' 'aarch64')
url='https://github.com/babygoton/WorkDaddy'
license=('AGPL-3.0-or-later')
depends=('bash' 'ca-certificates' 'curl' 'gcc-libs' 'glibc' 'hicolor-icon-theme'
         'procps-ng' 'util-linux' 'xdg-utils')
optdepends=('workbuddy: WorkBuddy desktop client enhanced by WorkDaddy'
            'workbuddy-agent: alternative WorkBuddy client; conflicts with workbuddy, install either one'
            'zenity: graphical launcher dialogs (channel menu, restart confirmation, wallpaper folder picker)')
provides=('workdaddy')
conflicts=('workdaddy')
options=('!strip' '!debug')
_dl='https://github.com/babygoton/WorkDaddy/releases/download'
source=('LICENSE.upstream')
source_x86_64=("WorkDaddy_${pkgver}_amd64.deb::${_dl}/${pkgver}/WorkDaddy_${pkgver}_amd64.deb")
source_aarch64=("WorkDaddy_${pkgver}_arm64.deb::${_dl}/${pkgver}/WorkDaddy_${pkgver}_arm64.deb")
sha256sums=('5e28b0607630f125776a775a76e4c96453d593451a0c65be832ef1282b89c4b5')
sha256sums_x86_64=('5b2fe8a44ce5ca1bd869bd1e27701f0a89f951719b0e29d80d826f5918b7b39c')
sha256sums_aarch64=('adb63b440c29d23dfc36c453ece6477735c3a4efcbc428e21bd8e5831c211428')

package() {
  case "$CARCH" in
    x86_64)  _deb="WorkDaddy_${pkgver}_amd64.deb" ;;
    aarch64) _deb="WorkDaddy_${pkgver}_arm64.deb" ;;
  esac

  # Official .deb is an ar archive with only ./control in control.tar.xz,
  # i.e. no maintainer scripts to emulate. Extract the payload verbatim.
  bsdtar -xf "$srcdir/$_deb" -C "$srcdir" data.tar.xz
  bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir"

  install -Dm644 "$srcdir/LICENSE.upstream" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
