# Contributor: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=container-use-bin
pkgver=0.4.2 # datasource=github-releases depName=dagger/container-use
pkgrel=2
pkgdesc='Development environments for coding agents.'
arch=('aarch64' 'x86_64')
url='https://container-use.com'
license=('Apache-2.0')

_repourl='https://github.com/dagger/container-use'

source=("LICENSE-${pkgver}::${_repourl}/raw/refs/tags/v${pkgver}/LICENSE")
source_aarch64=("${_repourl}/releases/download/v${pkgver}/container-use_v${pkgver}_linux_arm64.tar.gz")
source_x86_64=("${_repourl}/releases/download/v${pkgver}/container-use_v${pkgver}_linux_amd64.tar.gz")

sha256sums=('4442a42853bd02d190ce5f06f76ba62f1a0ff803e8cc1a524dcaa7085a0b100b')
sha256sums_aarch64=('96db6bc01111c573df83065bd02802a36a09864f45373169ffa227a9b3cdca14')
sha256sums_x86_64=('3fa52b5833ae4aed2be4b86f7cf42671fdf4bca8c211fe5fff08cc19553d409b')

package() {

	install -Dm755 "container-use" "$pkgdir/usr/bin/container-use"
	ln -sr "$pkgdir/usr/bin/container-use" "$pkgdir/usr/bin/cu"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	local commands=("container-use" "cu")

	cd "$srcdir/completions"

	for cmd in "${commands[@]}"; do
		install -Dm0644 "${cmd}.bash" "$pkgdir/usr/share/bash-completion/completions/${cmd}.bash"
		install -Dm0644 "${cmd}.fish" "$pkgdir/usr/share/fish/vendor_completions.d/${cmd}.fish"
		install -Dm0644 "${cmd}.zsh" "$pkgdir/usr/share/zsh/site-functions/_${cmd}"
	done
}
