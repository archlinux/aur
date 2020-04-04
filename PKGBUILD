# Maintainer: somini <dev@somini.xyz>
_pkgname=git-identity
pkgname=$_pkgname-git
pkgver=latest
pkgrel=2
pkgdesc="Manage your identity in Git"
arch=('any')
url="https://github.com/madx/git-identity"
license=('custom:WTFPL')
depends=('git')
# makedepends=()
# checkdepends=()
optdepends=('zsh: for zsh completion')
provides=('git-identity')
conflicts=('git-identity')
source=("$pkgname::git+https://github.com/madx/git-identity.git#branch=master")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/"
  git describe --always
}

package() {
	cd "$pkgname"
	install -D git-identity -t "$pkgdir/usr/bin"

	# License
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	# Completions
	install -Dm644 git-identity.bash-completion "$pkgdir$(pkg-config --variable=completionsdir bash-completion)/git-identity"
	install -Dm644 git-identity.zsh-completion "$pkgdir/usr/share/zsh/site-functions/_git-identity"
}
