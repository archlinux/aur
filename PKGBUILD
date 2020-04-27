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
echo 1
  cd $srcdir
echo 2
  rm -Rf $srcdir/bindfsit &>/dev/null || echo "No old repository found, proceding to git clone..."
echo 3
  git clone --depth 1 $_gitroot || return 1
echo ciao
}

package() {
  cd bindfsit
  install -D "bindfsit@.service" "${pkgdir}/usr/lib/systemd/system/bindfsit@.service"
  install -D "bindfsit.sh" "${pkgdir}/usr/bin/bindfs.sh"
  install -D "example.cfg" "${pkgdir}/etc/bindfs/example.cfg"
}

