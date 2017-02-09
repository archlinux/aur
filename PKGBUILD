# Maintainer: Antoine GIRARD <antoine.girard@sapk.fr>

pkgname=docker-volume-gvfs-git
_gitname="docker-volume-gvfs"
pkgver=0.0.1.8e25c2a
_pkgver=0.0.1
pkgrel=1
pkgdesc='Docker GvFS (ftp, ssh, smb, ...) Volume Plugin'
arch=(i686 x86_64)
url='https://github.com/sapk/docker-volume-gvfs'
license=(MIT)
depends=("gvfs")
optdepends=('gvfs-smb: for mounting smb'
            'gvfs-nfs: for mounting nfs')
makedepends=('git' 'go')
provides=("docker-volume-gvfs")
conflicts=("docker-volume-gvfs")
source=(git://github.com/sapk/docker-volume-gvfs)
sha1sums=('SKIP')

pkgver() {
  cd $srcdir/$_gitname
  echo "$_pkgver.$(git log --pretty=format:"%h" | head -n1)"
}

build() {
  cd $srcdir/$_gitname
  make
}

package() {
  cd $srcdir/$_gitname
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 $_gitname "${pkgdir}/usr/bin/$_gitname"
  install -Dm644 "support/systemd/lib/systemd/system/$_gitname.service" "${pkgdir}/usr/lib/systemd/system/$_gitname.service"
}
