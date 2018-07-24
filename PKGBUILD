# Maintainer: Hassan Zamani <hsn.zamani@gmail.com>
pkgname=cri-containerd-bin
pkgver=1.1.2
pkgrel=1
pkgdesc='An open and reliable container runtime'
url='https://containerd.io/'
depends=()
conflicts=('runc' 'containerd' 'crictl' 'crictl-bin')
provides=('runc' 'containerd' 'crictl')
arch=('x86_64')
license=("APACHE")
source=("cri-containerd-$pkgver.tar.gz::https://storage.googleapis.com/cri-containerd-release/cri-containerd-$pkgver.linux-amd64.tar.gz")
sha256sums=('d4ed54891e90a5d1a45e3e96464e2e8a4770cd380c21285ef5c9895c40549218')

prepare() {
  cd "$srcdir"
  # fix paths in service
  sed -i 's,/sbin,/usr/bin,;s,/usr/local,/usr,' etc/systemd/system/containerd.service
}

package() {
  cd "$srcdir"
  install -Dm755 usr/local/bin/containerd-release "$pkgdir"/usr/bin/containerd-release
  install -Dm755 usr/local/bin/containerd-stress "$pkgdir"/usr/bin/containerd-stress
  install -Dm755 usr/local/bin/containerd-shim "$pkgdir"/usr/bin/containerd-shim
  install -Dm755 usr/local/bin/containerd "$pkgdir"/usr/bin/containerd
  install -Dm755 usr/local/bin/critest "$pkgdir"/usr/bin/critest
  install -Dm755 usr/local/bin/crictl "$pkgdir"/usr/bin/crictl
  install -Dm755 usr/local/bin/ctr "$pkgdir"/usr/bin/ctr
  install -Dm755 usr/local/sbin/runc "$pkgdir"/usr/bin/runc
  install -Dm644 etc/systemd/system/containerd.service "$pkgdir"/usr/lib/systemd/system/containerd.service
  install -Dm644 etc/crictl.yaml "$pkgdir"/etc/crictl.yaml
}

# vim:set ts=2 sw=2 et:

