# Maintainer: Jai-JAP <jai dot jap dot 318 at gmail dot com>
pkgname=rip2-bin
pkgver=0.9.3
pkgrel=1
pkgdesc=" A safe and ergonomic alternative to rm "
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/MilesCranmer/rip2"

license=('GPL-3.0-or-later')
provides=('rip' 'rip2')
conflicts=('rip')

sha256sums_x86_64=('c7dc89831be0ac74aa8fbdbd96dfae35e9965693e8def61b0c21173ce066a620')
sha256sums_i686=('0f6ec4450e46f0ec5ffea93e1dcc3f061fb048420b4279a6aad6af4333484865')
sha256sums_aarch64=('ba55d471d20980346ea94fd3315c6034bcb4f3972b292521bc113d46012c2b59')
sha256sums_armv7h=('aaaf544114450863b90746fbe7859721228edfa19811bd664685a505ee91ed26')

source_x86_64=("rip2-x86_64.zip::${url}/releases/download/v${pkgver}/rip-Linux-x86_64-musl.tar.gz")
source_i686=("rip2-i686.zip::${url}/releases/download/v${pkgver}/rip-Linux-i686-musl.tar.gz")
source_aarch64=("rip2-aarch64.zip::${url}/releases/download/v${pkgver}/rip-Linux-aarch64-musl.tar.gz")
source_armv7h=("rip2-arm.zip::${url}/releases/download/v${pkgver}/rip-Linux-arm-musl.tar.gz")

build() {
	mkdir completions

  for _shell in bash zsh fish; do
  	./rip completions ${_shell} >"completions/rip.${_shell}"
	done
}

package() {
	install -Dm755 "./rip" "${pkgdir}/usr/bin/rip"

  install -Dm644 completions/rip.zsh "${pkgdir}/usr/share/zsh/site-functions/_rip"
	install -Dm644 completions/rip.bash "${pkgdir}/usr/share/bash-completion/completions/rip"
	install -Dm644 completions/rip.fish "${pkgdir}/usr/share/fish/vendor_completions.d/rip.fish"
}
