pkgbase="rtt"
pkgname="rtt-git"
pkgver=0.0.0.3
pkgrel=1
pkgdesc="RT_Thread tools!"
arch=("x86_64")
license=("Apache-2.0" "GPL-2.0")
depends=('git')
url="https://github.com/zhkag/rtt"

source=(${pkgbase}::git+https://github.com/zhkag/rtt.git)
sha512sums=('SKIP')

_rtt_root="/opt/rt-thread/tools/rtt"

pkgver() {
  cd ${pkgbase}
  _ver=`git describe --long --tags | sed 's/-/\./g; s/^v//; s/g*$//'`
  if [ -z "$_ver" ]; then
    _ver='0.0.0.'`git rev-list --count HEAD`
  fi
  echo $_ver
}

package() {
  local bin="${pkgdir}/usr/bin"
  install -d -m755 "${pkgdir}${_rtt_root}"
  install -d -m755 "${bin}"
  cp -r ${srcdir}/${pkgbase}/* "${pkgdir}${_rtt_root}"
  chown -R $USER:`id -g -n $USER` ${pkgdir}${_rtt_root}
  ln -s ${_rtt_root}/${pkgbase} ${bin}/${pkgbase}
}
