# Maintainer: Michael Bauer <michael@m-bauer.org>
pkgname=radicle-cli
pkgver=0.6.1
pkgrel=3
pkgdesc="Radicle command line interface"
arch=('x86_64')
url="https://app.radicle.xyz/seeds/seed.alt-clients.radicle.xyz/rad:git:hnrkmg77m8tfzj4gi4pa4mbhgysfgzwntjpao/tree"
license=('GPL3')
depends=('libusb' 'gcc-libs' 'openssl')
makedepends=('git' 'cargo')

_commit=1e6ed9b # tags/v0.6.1 - only available via github repo, missing on radicly.xyz :-(
# _commit=4ae4174 # tags/0.6.0

source=("$pkgname-$pkgver::git+https://github.com/radicle-dev/radicle-cli.git#commit=${_commit}")
# TODO: Use radicle.xyz source instead of gituhub when release commit is available there
# source=("$pkgname-$pkgver::git+https://seed.alt-clients.radicle.xyz/radicle-cli.git#commit=${_commit}")

sha512sums=('SKIP')

package() {
	depends+=('openssh')
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo install $pkgname --no-track --locked --root "$pkgdir/usr/" --path .
}
