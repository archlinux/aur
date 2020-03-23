# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Tristan Webb <tristanjwebb@gmail.com>

pkgname='wemux-git'
pkgver=3.2.0.r14.g01c6541
pkgrel=1
pkgdesc='Multi-user Tmux made easy'
arch=('any')
url='https://github.com/zolrath/wemux'
license=('MIT')
depends=('tmux' 'lsof' 'openssh')
makedepends=('git')
provides=("wemux=${pkgver%%.r*}")
conflicts=('wemux')
backup=('etc/wemux/wemux.conf')
install="${pkgname}.install"
_srcdir='wemux'
source=('git://github.com/zolrath/wemux.git')
md5sums=('SKIP')
sha256sums=('SKIP')

pkgver() {
  cd "${_srcdir}"
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "${_srcdir}"
  #cp -p 'wemux' 'wemux.Arch'
  sed -e 's:/usr/local/etc:/etc/wemux:g' -i 'wemux'
  test ! -f 'wemux.Arch'
}

package(){
  cd "${_srcdir}"

  #install manpage
  install -Dm644 'man/wemux.1' -t "${pkgdir}/usr/share/man/man1/"

  #install binary and readme
  install -Dm755 'wemux' -t "${pkgdir}/usr/bin/"
  install -Dm644 'README.md' -t "${pkgdir}/usr/share/wemux/"

  #install conf
  install -Dm644 'wemux.conf.example' "${pkgdir}/etc/wemux/wemux.conf"

  #install licence
  install -Dm644 'MIT-LICENSE' "${pkgdir}/usr/share/licenses/wemux/LICENSE"
}

# vim:set ts=2 sw=2 et:
