# Maintainer: Soraxas <oscar AT tinyiu DOT com>

_name=shsh
pkgname=shsh-git
pkgver=2.4.1.r3.gcd0814f
pkgrel=1
pkgdesc="A multi-threaded manager for shell scripts, functions, binaries, completions files. "
arch=('any')
url="https://github.com/soraxas/shsh"
license=('MIT')
depends=()
makedepends=('git')
provides=('shsh')
conflicts=('shsh')
source=("${pkgname}::git+https://github.com/soraxas/shsh#branch=master" "shsh-entrypoint.sh")
sha256sums=('SKIP' '23826816377fc14a0c9d7eb9d326ccfa0d887bb753e900939f2d7990380dba3a')


pkgver() {
  cd $pkgname
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd $srcdir/$pkgname

  install -dm755 "$pkgdir"/{usr/bin,usr/lib/shsh,usr/share/man/man1,usr/share/licenses/$_name}
  install -D -m 755 libexec/* "$pkgdir/usr/lib/shsh"
  install -D -m 755 "$srcdir/shsh-entrypoint.sh" "$pkgdir/usr/bin/shsh"
  install -D -m 644 man/man1/* "$pkgdir/usr/share/man/man1"
	install -D -m 644 completions/shsh.bash "${pkgdir}/usr/share/bash-completion/completions/shsh"
	install -D -m 644 completions/shsh.zsh "${pkgdir}/usr/share/zsh/site-functions/_shsh"
	install -D -m 644 completions/shsh.fish "${pkgdir}/usr/share/fish/completions/shsh.fish"
  install -D -m 644 LICENSE "$pkgdir"/usr/share/licenses/$_name/LICENSE
}

