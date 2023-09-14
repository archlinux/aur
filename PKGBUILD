# Maintainer: lucas <lucas.mior.2@gmail.com>

pkgbase=clipsim
pkgname=clipsim
pkgver=0.3
pkgrel=1
pkgdesc="clipsim is a simple and fast X clipboard manager written in C."
arch=(x86_64)
url='https://github.com/lucas-mior/clipsim'
license=(AGPL)
depends=(xclip libxfixes)
optdepends=()
makedepends=(git)
provides=(clipsim)
conflicts=(clipsim)
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
    echo "$pkgver"
}

build() {
	cd clipsim
	make
}

package() {
	cd clipsim
	make DESTDIR="${pkgdir}" PREFIX=/usr install

	install -Dm644 completions/fish/clipsim.fish \
                   "${pkgdir}/usr/share/fish/vendor_completions.d/clipsim.fish"
	install -Dm644 completions/bash/clipsim-completion.bash \
                   "${pkgdir}/usr/share/bash-completion/completions/clipsim"
	install -Dm644 completions/zsh/_clipsim \
                   "${pkgdir}/usr/share/zsh/site-functions/_clipsim"

	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
}
