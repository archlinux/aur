# Maintainer: nambona890 zander.morrow@gmail.com
pkgname=hfetch-git
pkgver=0b13a03
pkgrel=1
pkgdesc="A Clio Aite themed neofetch parody written in C just for lulz. Fork of jfetch by jffops."
arch=(x86_64 i686 pentium4 armv7h aarch64 riscv64)
url="https://github.com/nambona890/hfetch"
license=(MIT)
depends=(glibc)
optdepends=('nvidia: NVIDIA GPU detection support'
            'amdgpu_top: AMD GPU detection support' )
makedepends=(make git)
source=("git+https://github.com/nambona890/hfetch")
sha256sums=("SKIP")

pkgver() {
  cd "${srcdir}"/hfetch
  git describe --long --tags --always
}

build() {
  cd "${srcdir}"/hfetch
  export CFLAGS="${CFLAGS} -Wno-format-security"
  make
}

package() {
  cd "${srcdir}"/hfetch
  install -Dm755 hfetch "$pkgdir/usr/bin/hfetch"
  install -D LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
