# Maintainer: Bazyli Cyran <bazyli@cyran.dev>

pkgname=git-chain-git
_pkgname="${pkgname%-git}"
pkgver=0.0.6.r74.dffacb6
pkgrel=1
pkgdesc="Tool for rebasing a chain of local git branches."
arch=('x86_64')
url="https://github.com/dashed/git-chain"
license=('MIT')
depends=('git')
makedepends=('git' 'cargo') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("git-chain")
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	printf "%s.r%s.%s" "$(sed -n 's/^version = "\(.*\)"/\1/p' Cargo.toml)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${_pkgname}"
    cargo build --release --locked
}

package() {
    cd "${_pkgname}"
    install -Dm 755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${_pkgname}"
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}
