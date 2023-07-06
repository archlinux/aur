# Contributor: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Tristan Webb <tristanjwebb@gmail.com>

_name=wemux
pkgname=wemux-git
pkgver=3.2.0.r52.g9d96c4f
pkgrel=1
pkgdesc='Multi-user Tmux made easy'
arch=('any')
url='https://github.com/zigdon/wemux'
license=('MIT')
depends=('tmux' 'lsof' 'openssh')
makedepends=('git')
provides=("wemux=${pkgver%%.r*}")
conflicts=('wemux')
backup=('etc/wemux/wemux.conf')
install="${pkgname}.install"
source=(git+${url}.git)
sha256sums=('SKIP')

pkgver() {
  cd "${_name}"
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "${_name}"
  #cp -p 'wemux' 'wemux.Arch'
  sed -e 's:/usr/local/etc:/etc/wemux:g' -i 'wemux.in'
  test ! -f 'wemux.Arch'
}

package(){
  cd "${_name}"

  #install manpage
  install -Dm644 'man/wemux.1.in' -T "${pkgdir}/usr/share/man/man1/wemux.1"

  #install binary and readme
  install -Dm755 'wemux.in' -T "${pkgdir}/usr/bin/wemux"
  install -Dm644 'README.md' -t "${pkgdir}/usr/share/wemux/"

  #install conf
  install -Dm644 'wemux.conf.example' "${pkgdir}/etc/wemux/wemux.conf"

  #install licence
  install -Dm644 'MIT-LICENSE' "${pkgdir}/usr/share/licenses/wemux/LICENSE"
}

# vim:set ts=2 sw=2 et:
