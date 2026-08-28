pkgname=virtctl-git
pkgver=r54.d7dd620
pkgrel=1
arch=('any')
url="https://github.com/dehesselle/virtctl"
license=('MIT')
depends=('libvirt')
pkgdesc="virtctl is a script and framework for libvirt to integrate it with systemd."
source=(
  "$pkgname::git+https://github.com/dehesselle/virtctl.git"
)
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"
  mkdir -p "$pkgdir/usr/lib/systemd/system"
  mkdir -p "$pkgdir/etc"

  for systemd_file in hypervisor.target virtctl@.service virtctl@.service.d; do
    cp -a $systemd_file "$pkgdir/usr/lib/systemd/system"
  done

  cp -a "virtctl.d" "$pkgdir/etc"
}
