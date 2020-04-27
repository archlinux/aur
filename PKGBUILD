# Maintainer : Antonio Orefice <kokoko3k@gmail.com>

pkgname=bindfsit-git
pkgver=20200427
pkgrel=1
pkgdesc="Rebinds filesystems to free stuck processes."
arch=('any')
url="https://github.com/kokoko3k/bindfsit"
license=('custom')

depends=(
    'bindfs'
    'bash'
)

_gitroot="https://github.com/kokoko3k/bindfsit.git"

build() {
  cd $srcdir
  rm -Rf $srcdir/bindfsit &>/dev/null || echo "No old repository found, proceding to git clone..."
  git clone --depth 1 $_gitroot || return 1
}

package() {
  cd bindfsit
  install -D "bindfsit@.service" "${pkgdir}/usr/lib/systemd/system/bindfsit@.service"
  install -D "bindfsit.sh" "${pkgdir}/usr/bin/bindfsit.sh"
  install -D "example.cfg" "${pkgdir}/etc/bindfs/example.cfg"
}

