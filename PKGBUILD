pkgname=enroot-git
pkgver=2.1.0
pkgrel=1
pkgdesc='A simple yet powerful tool to turn traditional container/OS images into unprivileged sandboxes.'
url='https://github.com/NVIDIA/enroot'
arch=(x86_64)
license=(BSD)
makedepends=(git gcc make libtool)
depends=(jq parallel squashfs-tools)
optdepends=(fuse-overlayfs-git libnvidia-container-tools pigz pv squashfuse)
provides=(enroot)
install="${pkgname}.install"
source=("git+https://github.com/NVIDIA/enroot.git#tag=v${pkgver}")
sha256sums=(SKIP)

build() {
  cd 'enroot'
  CPPFLAGS="-DALLOW_SPECULATION -DINHERIT_FDS" make prefix='' exec_prefix=/usr datarootdir=/usr/share
}

package() {
  cd 'enroot'
  DESTDIR="$pkgdir/" make install prefix='' exec_prefix=/usr datarootdir=/usr/share
  mkdir -p "${pkgdir}/usr/share/bash-completion/completions"
  mv "${pkgdir}/usr/share/enroot/enroot.bash_completion" "${pkgdir}/usr/share/bash-completion/completions/enroot"
}
