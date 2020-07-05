# Maintainer: Ahmad Hasan Mubashshir <ahmubashshir@gmail.com>
pkgname=tldr-sh
pkgver=r71.6bd83e6
pkgrel=1
pkgdesc="A fully-functional POSIX shell client for tldr."
arch=(any)
url="https://github.com/raylee/tldr-sh-client"
license=('MIT')
depends=('curl')
provides=('tldr' 'tldr-sh')
conflicts=(
	'tldr'
	'tldr++'
	'tldr-git'
	'tealdeer'
	'nodejs-tldr'
	'tealdeer-bin'
	'tealdeer-git'
	'tldr-bash-git'
	'nodejs-tldr-git'
	'tldr-cpp-client'
	'tldr-go-client-git'
	'tldr-python-client'
)
source=('tldr-sh::git+https://github.com/raylee/tldr-sh-client')
md5sums=(SKIP)

pkgver()
{
  	cd "$srcdir/$pkgname"
	( set -o pipefail
	git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
	pkgrel=$(git diff --shortstat|cut -d' ' -f2)
}

package() {
	cd "$srcdir/$pkgname"
	install -Dm755 tldr "$pkgdir/usr/bin/tldr"
}
